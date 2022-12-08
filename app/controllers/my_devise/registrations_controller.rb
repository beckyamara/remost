require "open-uri"
require "csv"

class MyDevise::RegistrationsController < Devise::RegistrationsController
  before_action :check_company, only: [:new]
  before_action :configure_permitted_parameters

  def after_update_path_for(resource)
    user_path(resource)
  end

  def new
    build_resource
    @company = Company.find_by(company_code: params[:company_code])
    yield resource if block_given?
    respond_with resource
  end

  def create
    build_resource(sign_up_params)
    if City.where(name: params[:user][:location]).empty?
      filepath = 'lib/assets/country_flags.csv'
      CSV.foreach(filepath, headers: :first_row) do |row|
        @flag = row['Emoji'] if params[:user][:location].split(",").map(&:strip).last == row['Name']
      end
      city_photo = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485634/ReMost/paris_id5nmp.jpg")
      new_city = City.create!(name: params[:user][:location], flag: @flag)
      new_city.photo.attach(io: city_photo, filename: 'paris.jpg', content_type: 'image/jpg')
      resource.city = new_city
    else
      resource.city = City.where(name: sign_up_params[:location])[0]
    end
    @company = Company.where(company_code: params[:company_code])[0]
    resource.company = @company

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    if params[:user][:location] != resource.city.name
      if City.where(name: params[:user][:location]).empty?
        filepath = 'lib/assets/country_flags.csv'
        CSV.foreach(filepath, headers: :first_row) do |row|
          @flag = row['Emoji'] if params[:user][:location].split(",").map(&:strip).last == row['Name']
        end
        city_photo = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485634/ReMost/paris_id5nmp.jpg")
        new_city = City.create!(name: params[:user][:location], flag: @flag)
        new_city.photo.attach(io: city_photo, filename: 'paris.jpg', content_type: 'image/jpg')
        resource.city = new_city
      else
        resource.city = City.where(name: sign_up_params[:location])[0]
      end
    end

    resource_updated = update_resource(resource, account_update_params)

    yield resource if block_given?
    if resource_updated
      set_flash_message_for_update(resource, prev_unconfirmed_email)
      bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private

  def build_resource(hash = {})
    self.resource = resource_class.new_with_session(hash, session)
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

  def update_resource(resource, params)
    resource.update_with_password(params)
  end

  def sign_in_after_change_password?
    return true if account_update_params[:password].blank?

    Devise.sign_in_after_change_password
  end

  def update_needs_confirmation?(resource, previous)
    resource.respond_to?(:pending_reconfirmation?) &&
      resource.pending_reconfirmation? &&
      previous != resource.unconfirmed_email
  end

  def set_flash_message_for_update(resource, prev_unconfirmed_email)
    return unless is_flashing_format?

    flash_key = if update_needs_confirmation?(resource, prev_unconfirmed_email)
                  :update_needs_confirmation
                elsif sign_in_after_change_password?
                  :updated
                else
                  :updated_but_not_signed_in
                end
    set_flash_message :notice, flash_key
  end

  def check_company
    if params[:company_code] && params[:email]
      email_domain = params[:email][/@\S+.\w+/]
      if Company.all.map {|company| company.company_code}.include?(params[:company_code])
        @company = Company.find_by(company_code: params[:company_code])
        redirect_to step_path(:company), alert: "Wrong Email - please use your corporate email address." unless @company.email_domain.split(",").include?(email_domain)
      else
        redirect_to step_path(:company), alert: "Invalid company code. Please, contact the admin of your workspace :("
      end
    end
  end
end

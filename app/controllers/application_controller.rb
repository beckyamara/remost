class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:photo, :first_name, :last_name, :city_id, :company_id, :department, :job_title, :location, :languages, :linkedin, :open_to, :slack_user])

    # For additional fields in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:photo, :first_name, :last_name, :city_id, :company_id, :department, :job_title, :location, :languages, :linkedin, :open_to, :slack_user])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

end

class CompaniesController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @code = [*('a'..'z'), *('0'..'9')].sample(8).join
    @company.company_code = @code
    if @company.save
      redirect_to new_user_registration_path(@company), alert: "Congratulations! Your company code is: #{@code}. You can now share it with your co-workers!"
    else
      render 'new', status: :unprocessable_entity, alert: "Can't create company :( Get in touch with us please!"
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :slack_sub_domain, :email_domain, :company_size)
  end
end

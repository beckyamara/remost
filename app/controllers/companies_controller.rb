class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to new_user_registration_path(@company)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :slack_sub_domain)
  end
end

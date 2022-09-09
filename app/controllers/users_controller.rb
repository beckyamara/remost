class UsersController < ApplicationController
  def index
    @users = User.where(company: current_user.company)

    # if params[:query].present?
    #   @users = User.where(company: current_user.company).search_by_job_department_name(params[:query])
    # else
    #   @users = User.where(company: current_user.company)
    # end
    @users = @users.filter_by_job(params[:job_title]) if params[:job_title].present?
    @users = @users.filter_by_department(params[:department]) if params[:department].present?
    @users = @users.filter_by_languages(params[:languages]) if params[:languages].present?
    @users = @users.to_a.select { |user| params[:date] == "" ? user.city.name == params[:city] : user.current_city(params[:date]).name == params[:city] } if params[:city].present?
  end

  def show
    @user = User.find(params[:id])
  end
end

class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @users = User.where(company: current_user.company)
    @users = @users.search_by_job_city_name(params[:query]) if params[:query].present?
    @users = @users.filter_by_job(params[:job_title]) if params[:job_title].present?
    @users = @users.filter_by_department(params[:department]) if params[:department].present?
    @users = @users.filter_by_open_to(params[:open_to]) if params[:open_to].present?
    @users = @users.to_a.select { |user| params[:date] == "" ? user.city.name == params[:city] : user.current_city(params[:date]).name == params[:city] } if params[:city].present?
  end

  def show
    @current_user = current_user
    @user = User.find(params[:id])
    @company_domain = @user.company.slack_sub_domain
    @user_slack = @user.slack_user
    @slack = "slack://user?team=#{@company_domain}&id=#{@user_slack}"
    @linkedin = "https://www.linkedin.com/in/#{@user.linkedin}"
    @email = "mailto:#{@user.email}"
  end
end

class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @users = User.where(company: current_user.company)
    @users = @users.search_by_job_city_name(params[:query]) if params[:query].present?
    @users = @users.filter_by_job(params[:job_title]) if params[:job_title].present?
    @users = @users.filter_by_department(params[:department]) if params[:department].present?
    # @users = @users.filter_by_open_to(params[:open_to]) if params[:open_to].present?
    @users = @users.to_a.select { |user| params[:date] == "" ? user.city.name.include?(params[:city]) : user.current_city(params[:date]).name.include?(params[:city])} if params[:city].present?

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'users/list', :formats=>[:text, :html], locals: { users: @users } }
    end
  end

  def autocomplete
    list = City.order(:name)
               .where("name ilike :q", q: "%#{params[:q]}%")

    render json: list.map { |c| { id: c.id, name: m.name.split(",").first } }
  end

  def department_autocomplete
    list = User.all.collect { |u| [u.department] }.uniq
    render json: list
  end

  def show
    @current_user = current_user
    @user = User.find(params[:id])
    @company_domain = @user.company.slack_sub_domain
    @user_slack = @user.slack_user
    @slack = "slack://user?team=#{@company_domain}&id=#{@user_slack}"
    @linkedin = "https://www.linkedin.com/in/#{@user.linkedin}"
    @email = "mailto:#{@user.email}"
    @trips = @user.trips
    @upcoming_trips = @user.trips.select { |trip| trip.end_date > Date.today }
  end
end

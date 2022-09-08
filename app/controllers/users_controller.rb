class UsersController < ApplicationController
  def index
    @users = User.where(company: current_user.company)

    if params[:query].present?
      @users = User.where(company: current_user.company).search_by_job_department_name(params[:query])
    else
      @users = User.where(company: current_user.company)
    end
  end

  def show
    @user = User.find(params[:id])
  end
end

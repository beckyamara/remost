class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
    @user = current_user
    @teammates = User.where(company: current_user.company)
    @cities = City.all
    @trips = Trip.joins(:user).where("users.company_id = ?", current_user.company.id)
  end
end

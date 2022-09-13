class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @user = current_user
    @cities =City.all
    @users = User.all
    # @trips = City.all.trips
    # @company_cities = current_user.company.users.city.count
  end
end

class CitiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @teammates = User.where(company: current_user.company)
    p @teammates.select {|tm| tm.city_id == 2 }

    @cities = City.all
    @markers = @cities.geocoded.map do |city|
      city_people = @teammates.select {|tm| tm.city == city }
      p city_people
      {
        lat: city.latitude,
        lng: city.longitude,
        people_window: render_to_string(partial: "people_window", locals: { city: city, city_people: city_people })
      }
    end
  end

  def show
    set_city
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name)
  end

  # def find_locals
  #   @city = set_city
  #   @locals = User.where(:city_id == @city )
  #   @locals.each do |local|
  #     @trips = local.trips
  #     @trips.each do |trip|

  #     end
  #   end
  # end
end

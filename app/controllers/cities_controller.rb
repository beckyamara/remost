class CitiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @teammates = User.where(company: current_user.company)
    if params[:date]
      @date = Date.parse(params[:date])
      @teammates.each do |t|
        t.current_city(@date)
      end
    end

    @cities = City.all
    @markers = @cities.geocoded.map do |city|
      if @date
        city_people = @teammates.select {|tm| tm.current_city(@date) == city }
      else
        city_people = @teammates.select {|tm| tm.city == city }
      end
      p city_people
      {
        lat: city.latitude,
        lng: city.longitude,
        people_window: render_to_string(partial: "people_window", locals: { city: city, city_people: city_people })
      }
    end
  end

  def show
    @city = City.find(params[:id])
    @tips = Tip.where(city: @city)

    @tips_markers = @tips.geocoded.map do |tip|
      {
        lat: tip.latitude,
        lng: tip.longitude,
        tips_window: render_to_string(partial: "tips_window", locals: { city: @city, tip: tip })
      }
    end
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name)
  end

end

class CitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @teammates = User.where(company: current_user.company)
    if params[:date] && params[:date] != ""
      @date = Date.parse(params[:date])
      @teammates.each do |t|
        t.current_city(@date)
      end
    end
    @teammates = @teammates.filter_by_job(params[:job_title]) if params[:job_title].present?
    @teammates = @teammates.filter_by_department(params[:department]) if params[:department].present?
    # @teammates = @teammates.filter_by_languages(params[:languages]) if params[:languages].present?

    @cities = City.all
    @markers = @cities.geocoded.map do |city|
      if @date
        city_people = @teammates.select {|tm| tm.current_city(@date) == city }
      else
        city_people = @teammates.select {|tm| tm.city == city }
      end
      if city_people != 0
        {
          lat: city.latitude,
          lng: city.longitude,
          people_window: render_to_string(partial: "people_window", locals: { city: city, city_people: city_people }),
          image_url: helpers.asset_url("map-pin.svg"),
          marker: render_to_string(partial: "marker", locals: { city: city, city_count: city_people.count, sample_person_image: city_people.sample ? city_people.sample.photo.attached? ? city_people.sample.photo.key : "default_image" : "default_image"})
        }
      end
    end
  end

  def show
    @city = set_city
    @tip = Tip.new
    # @bookmarked_place = BookmarkedPlace.new

    if params[:date]
      @date = Date.parse(params[:date])
    else
      @date = Date.today
    end
    @teammates = User.where(company: current_user.company)
    @teammates = @teammates.filter_by_job(params[:job_title]) if params[:job_title].present?
    @teammates = @teammates.filter_by_department(params[:department]) if params[:department].present?
    @teammates = @teammates.filter_by_languages(params[:languages]) if params[:languages].present?
    @places = Place.where(city: @city)
    @tips = Tip.where(city: @city)
    @places_markers = @places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        place_window: render_to_string(partial: "place_window", locals: { city: @city, place: place, tips: Tip.where(place: place) }),
        place_marker: render_to_string(partial: "place_marker", locals: { city: @city, places: @places, place: place, category: place.category })
      }
    end
    if params[:date]
      @teammates_city = @teammates.select { |t| t.current_city(@date) == @city }.compact
    else
      @teammates_city = @teammates.select { |t| t.city == @city }.compact
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

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
    @teammates = @teammates.filter_by_languages(params[:languages]) if params[:languages].present?
    @teammates = @teammates.to_a.select { |user| params[:date] == "" ? user.city.name == params[:city] : user.current_city(params[:date]).name == params[:city] } if params[:city].present?

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
    @tips = Tip.where(city: @city)
    @tips_markers = @tips.geocoded.map do |tip|
      {
        lat: tip.latitude,
        lng: tip.longitude,
        tips_window: render_to_string(partial: "tips_window", locals: { city: @city, tip: tip, bookmarked_place: @bookmarked_place }),
        tip_marker: render_to_string(partial: "tip_marker", locals: { city: @city, tips: @tips, tip: tip, category: tip.category })
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

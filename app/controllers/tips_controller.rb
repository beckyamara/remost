require "json"
require "open-uri"

class TipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tips = Tip.all
    @city = set_city
  end

  def create
    set_city
    @company = current_user.company
    @place = Place.create!(name: params[:name], location: params[:location], category: params[:category], city: @city, company: @company)
    if @place.latitude.nil?
      mapbox_key = ENV.fetch('MAPBOX_API_KEY')
      encoded_location = CGI::escape(@place.location)
      url = "https://api.mapbox.com/geocoding/v5/mapbox.places/#{encoded_location}.json?access_token=#{mapbox_key}"
      @response = RestClient.get(url)
      @response_parsed = JSON.parse(@response)
      longitude = @response_parsed["features"][0]["center"][0]
      latitude = @response_parsed["features"][0]["center"][1]
      @place.longitude = longitude
      @place.latitude = latitude
    end

    if @city.places.where(company: current_user.company, name: @place.name, latitude: @place.latitude, longitude: @place.longitude).length > 1
      duplicates_array = @city.places.where(company: current_user.company, name: @place.name, latitude: @place.latitude, longitude: @place.longitude)
      original_place = duplicates_array[0]
      Place.delete(duplicates_array[1].id)
      @place = original_place
    end
    @tip = Tip.new(tip_params)
    @tip.place = @place
    @tip.user = current_user
    if @tip.save
      redirect_to city_path(@city), alert: "Recommendation successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    set_city
    @tip = Tip.find(params[:id])
    @tip.destroy
    redirect_to tips_path, status: :see_other, alert: "Recommendation successfully deleted."
  end

  private

  def set_city
    @city = City.find(params[:city_id])
  end

  def tip_params
    params.require(:tip).permit(:rating, :content, place_attributes: [:location, :name, :category])
  end
end

require "csv"
require "open-uri"

class TripsController < ApplicationController
  before_action :authenticate_user!

  def index
    @trips = Trip.all
    @tips = Tip.all
    @user = current_user
    # @user_tips = BookmarkedPlace.where(user: current_user)
    @teammates = User.where(company: current_user.company)
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if City.where(name: trip_params[:destination]).empty?
      filepath = 'lib/assets/country_flags.csv'
      CSV.foreach(filepath, headers: :first_row) do |row|
        @flag = row['Emoji'] if trip_params[:destination].split(",").map(&:strip).last == row['Name']
      end
      unsplash_key = ENV.fetch('UNSPLASH_ACCESS_KEY')
      @url = "https://api.unsplash.com/search/photos?query=#{I18n.transliterate(@trip.destination.split(',').first)}&orientation=portrait&client_id=#{unsplash_key}"
      @response = RestClient.get(@url)
      @response_parsed = JSON.parse(@response)
      if @response_parsed["total"].zero?
        city_photo = URI.open("https://images.unsplash.com/photo-1502210600188-51a3adffa4aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80")
        new_city = City.create!(name: trip_params[:destination], flag: @flag)
        formatted_city_name = "#{@trip.destination.split(',').first} #{@trip.destination.split(',').last}".gsub!(" ", "_")
        new_city.photo.attach(io: city_photo, filename: "#{formatted_city_name}-placeholder.jpg", content_type: 'image/jpg')
      else
        @first_result_url = @response_parsed["results"].first["urls"]["small"]
        city_photo = URI.open(@first_result_url.to_s)
        new_city = City.create!(name: trip_params[:destination], flag: @flag)
        formatted_city_name = "#{@trip.destination.split(',').first} #{@trip.destination.split(',').last}".gsub!(" ", "_")
        new_city.photo.attach(io: city_photo, filename: "#{formatted_city_name}.jpg", content_type: 'image/jpg')
      end
      @trip.city = new_city
    else
      @trip.city = City.where(name: trip_params[:destination])[0]
    end
    if @trip.save
      redirect_to city_path(@trip.city, date: @trip.start_date), alert: "Trip successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    set_trip
  end

  def edit
    set_trip
  end

def update
    set_trip
    unless City.where(name: trip_params[:destination]).exists?
      unsplash_key = ENV.fetch('UNSPLASH_ACCESS_KEY')
      @trip.update(trip_params)
      @url = "https://api.unsplash.com/search/photos?query=#{I18n.transliterate(@trip.destination)}&orientation=portrait&client_id=#{unsplash_key}"
      @response = RestClient.get(@url)
      @response_parsed = JSON.parse(@response)
      if @response_parsed["total"].zero?
        city_photo = URI.open("https://images.unsplash.com/photo-1502210600188-51a3adffa4aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80")
        new_city = City.create!(name: trip_params[:destination])
        formatted_city_name = "#{@trip.destination.split(',').first} #{@trip.destination.split(',').last}".gsub!(" ", "_")
        new_city.photo.attach(io: city_photo, filename: "#{formatted_city_name}-placeholder.jpg", content_type: 'image/jpg')
      else
        @first_result_url = @response_parsed["results"].first["urls"]["small"]
        city_photo = URI.open(@first_result_url.to_s)
        new_city = City.create!(name: trip_params[:destination])
        formatted_city_name = "#{@trip.destination.split(',').first} #{@trip.destination.split(',').last}".gsub!(" ", "_")
        new_city.photo.attach(io: city_photo, filename: "#{formatted_city_name}.jpg", content_type: 'image/jpg')
      end
      @trip.city = new_city
    else
      @trip.city = City.where(name: trip_params[:destination])[0]
    end
    @trip.update(trip_params)
    if @trip.start_date <= @trip.end_date
      redirect_to trips_path, alert: "Trip successfully updated."
    else
      redirect_to edit_trip_path(@trip), alert: "The end date must be after the start date (or the same day)."
    end
  end

  def destroy
    set_trip
    @trip.destroy
    redirect_to trips_path, alert: "Trip successfully deleted."
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:city_id, :start_date, :end_date, :destination)
  end
end

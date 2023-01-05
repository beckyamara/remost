class BookmarkedPlacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tip, only: [:create]

  def index
    @bookmarked_places = BookmarkedPlace.where(user: current_user)

    # @saved_tips = @bookmarked_places.filter_by_city(params[:city]) if params[:city].present?
    # @saved_tips = @bookmarked_places.filter_by_category(params[:category]) if params[:category].present?
    # @saved_tips = @bookmarked_places.filter_by_user(params[:user]) if params[:user].present?
    # @saved_tips = @bookmarked_places.filter_by_rating(params[:rating]) if params[:rating].present?

    # @bookmarked_places = @bookmarked_places.to_a.select { |b| b.place.city.name == params[:city] } if params[:city].present?
    @bookmarked_places_cities = []
    @bookmarked_places.to_a.each { |b| @bookmarked_places_cities.push({ "id" => b.place.city.id, "name" => b.place.city.name }) }
    @bookmarked_places_cities = @bookmarked_places_cities.uniq
    # @bookmarked_places.each { |b| b.picture = "place-category-sq-#{b.place.category.split.last}" }
    @bookmarked_places = @bookmarked_places.search_by_city_name_category(params[:query]) if params[:query].present?
    @bookmarked_places = @bookmarked_places.to_a.select { |b| b.place.city.name.include?(params[:city]) } if params[:city].present?
    @bookmarked_places = @bookmarked_places.to_a.select { |b| b.place.category == params[:category] } if params[:category].present?
  end

  def favourite
    @bookmarked_place = BookmarkedPlace.new
    @bookmarked_place.place = set_place
    @bookmarked_place.user = current_user || params[:user_id]
    respond_to do |format|
      if @bookmarked_place.save
        format.html { redirect_to city_path(@bookmarked_place.place.city) }
        format.json { render json: { message: @bookmarked_place.id } }
      else
        format.html { render :show, status: :unproccessable_entity }
        format.json { render json: { message: "failure" } }
      end
    end
  end

  def unfavourite
    @bookmarked_place = BookmarkedPlace.find(params[:bookmarked_place_id])
    @bookmarked_place.destroy
    respond_to do |format|
      format.html { redirect_to bookmarked_places_path }
      format.json { render json: { message: "success" } }
    end
  end

  private

  def set_place
    Place.find(params[:place_id])
  end
end

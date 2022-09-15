class BookmarkedPlacesController < ApplicationController
  before_action :set_tip, only: [:create]

  def index
    @bookmarked_places = BookmarkedPlace.where(user: current_user)
    @bookmarked_places = @bookmarked_places.to_a.select { |b| b.tip.city.name == params[:city] } if params[:city].present?
  end

  def favourite
    @bookmarked_place = BookmarkedPlace.new
    @bookmarked_place.tip = set_tip
    @bookmarked_place.user = current_user || params[:user_id]
    respond_to do |format|
      if @bookmarked_place.save
        format.html {redirect_to city_path(@bookmarked_place.tip.city)}
        format.json {render json: {message: @bookmarked_place.id}}
      else
        format.html {render :show, status: :unproccessable_entity}
        format.json {render json: {message: "failure"}}
      end
    end
  end

  def unfavourite
    @bookmarked_place = BookmarkedPlace.find(params[:bookmarked_place_id])
    @bookmarked_place.destroy
    respond_to do |format|
      format.html { redirect_to bookmarked_place_path }
      format.json {render json: {message: "success"}}
    end
  end

  private

  def set_tip
    Tip.find(params[:tip_id])
  end
end

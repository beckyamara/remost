class BookmarkedPlacesController < ApplicationController
  before_action :set_tip, only: [:create]

  def index
    @bookmarked_places = BookmarkedPlace.where(user: current_user)
  end

  def create
    @bookmarked_place = BookmarkedPlace.new
    @bookmarked_place.tip = @tip
    @bookmarked_place.user = current_user
    if @bookmarked_place.save
      redirect_to tip_path(@tip)
    else
      render :show, status: :unproccessable_entity
    end
  end

  def destroy
    @bookmarked_place = BookmarkedPlace.find(params[:id])
    @bookmarked_place.destroy
    redirect_to bookmarked_places_path
  end

  private

  def set_tip
    @tip = Tip.find(params[:tip_id])
  end
end

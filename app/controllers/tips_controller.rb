class TipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tips = Tip.all
    @city = set_city
  end

  def create
    set_city
    # if @city.places.where(company: current_user.company)
    @place = Place.create!(name: params[:name], location: params[:location].split(',').drop(1).map(&:strip).join(", "), category: params[:category], city: @city)
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

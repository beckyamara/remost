class CitiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @cities = City.all
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
end

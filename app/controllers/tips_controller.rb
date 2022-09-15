class TipsController < ApplicationController
  def index
    @tips = Tip.all
    @city = set_city
  end

  def create
    set_city
    @tip = Tip.new(tip_params)
    @tip.user = current_user
    @tip.city = @city
    if @tip.save
      redirect_to city_path(@city), alert: "Recommendation successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    set_city
    @tip = Tip.find(params[:id])
    @tip.destroy
    redirect_to tips_path, status: :see_other
  end

  private

  def set_city
    @city = City.find(params[:city_id])
  end

  def tip_params
    params.require(:tip).permit(:name, :location, :rating, :category, :content)
  end
end

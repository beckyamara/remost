class TripsController < ApplicationController
  def index
    @trips = Trip.all
    @tips = Tip.all
    @user = current_user
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trips_path # change to city_path(@city) later
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
    @trip.update(trip_params)
    redirect_to trips_path
  end

  def destroy
    set_trip
    @trip.destroy
    redirect_to trips_path
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:city_id, :start_date, :end_date)
  end
end

class BookingsController < ApplicationController
  # check if 'def new' works as intended
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @artifact = Artifact.find(params[:artifact_id])
    @booking.artifact = @artifact
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path
    else
      redirect_to artifact_path(@artifact)
    end

  end

  def index
    @bookings = Booking.all
  end

  private

  def booking_params
    params.require(:booking).permit(:check_out_date, :return_date)
  end
end

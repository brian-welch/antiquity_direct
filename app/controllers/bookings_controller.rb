class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.booking_pending = true
    if @booking.save
      flash[:notice] = "Booking was successfully requested. Now awaiting approval."
      redirect_to dashboard_path
    else
      @artifact = @booking.artifact
      render "artifacts/show" # , anchor: "#start-booking-form"
    end

  end

  private

  def booking_params
    params.require(:booking).permit(:check_out_date, :return_date, :artifact_id)
  end
end

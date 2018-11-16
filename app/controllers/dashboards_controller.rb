class DashboardsController < ApplicationController
  def index
    @user = current_user
    @my_bookings = current_user.bookings
    @artifacts = Artifact.all

    @customer_bookings = []

    Booking.order(:check_out_date).each do |booking|
      unless @my_bookings.include?(booking)
        @customer_bookings << booking
      end
    end
  end

  def create
    changed_booking = Booking.find(params[:booking_id])
    if params[:status] == "confirmed"
      changed_booking.booking_confirmed = true
    elsif params[:status] == "declined"
      changed_booking.booking_declined = true
    end
    changed_booking.save!
    redirect_to dashboard_path
  end
  # def create
  #   @booking = Booking.new(booking_params)
  #   @booking.user = current_user
  #   @booking.booking_pending = true
  #   if @booking.save
  #     flash[:notice] = "Booking was successfully requested. Now awaiting approval."
  #     redirect_to dashboard_path
  #   else
  #     @artifact = @booking.artifact
  #     render "artifacts/show" # , anchor: "#start-booking-form"
  #   end

  # end
end

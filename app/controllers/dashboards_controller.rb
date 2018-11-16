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
      changed_booking.booking_declined = false
    elsif params[:status] == "declined"
      changed_booking.booking_confirmed = false
      changed_booking.booking_declined = true
    end
    changed_booking.save!
    redirect_to dashboard_path
  end
end

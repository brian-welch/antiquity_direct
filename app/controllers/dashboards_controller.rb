class DashboardsController < ApplicationController
  def index
    @user = current_user
    @my_bookings = current_user.bookings
    @artifacts = Artifact.all

    @customer_bookings = []
    @customer_bookings_pending = 0
    @customer_bookings_confirmed = 0
    @customer_bookings_declined = 0

    # @test = Users.joins(:bookings).where("bookings.user:id = current_user.artifact")



    Booking.order(:check_out_date).each do |booking|
      unless @my_bookings.include?(booking)
        @customer_bookings_pending += 1 if booking.booking_pending == true
        @customer_bookings_confirmed += 1 if booking.booking_confirmed == true
        @customer_bookings_declined  += 1 if booking.booking_declined == true
        @customer_bookings << booking
      end
    end

  end

  def create
    changed_booking = Booking.find(params[:booking_id])
    if params[:status] == "confirmed"
      changed_booking.booking_confirmed = true
      changed_booking.booking_declined = false
      changed_booking.booking_pending = false
    elsif params[:status] == "declined"
      changed_booking.booking_confirmed = false
      changed_booking.booking_declined = true
      changed_booking.booking_pending = false
    end
    changed_booking.save!
    redirect_to dashboard_path
  end
end

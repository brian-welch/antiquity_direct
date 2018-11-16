class DashboardsController < ApplicationController
  def index
    @user = current_user
    @my_bookings = current_user.bookings
    @artifacts = Artifact.all

    @customer_bookings = []

    Booking.all.each do |booking|
      unless @my_bookings.include?(booking)
        @customer_bookings << booking
      end
    end
  end
end

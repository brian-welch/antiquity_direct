class DashboardsController < ApplicationController

def index
  @user = current_user
  @bookings = Booking.all
end
 end

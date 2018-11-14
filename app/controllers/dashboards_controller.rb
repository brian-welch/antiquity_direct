class DashboardsController < ApplicationController

def index
  @user = current_user
  @bookings = Booking.all
  @artifacts = Artifact.all
end
 end

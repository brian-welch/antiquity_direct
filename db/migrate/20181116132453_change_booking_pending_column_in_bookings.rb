class ChangeBookingPendingColumnInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bookings, :booking_pending, true
  end
end

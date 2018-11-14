class AddDeclineBookingStatusColumnToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :booking_declined, :boolean, default: false
  end
end

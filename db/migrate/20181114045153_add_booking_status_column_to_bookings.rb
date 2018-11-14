class AddBookingStatusColumnToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :booking_pending, :boolean, default: false
    add_column :bookings, :booking_confirmed, :boolean, default: false
  end
end

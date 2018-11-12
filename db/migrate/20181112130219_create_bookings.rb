class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :artifact, foreign_key: true
      t.references :user, foreign_key: true
      t.date :check_out_date
      t.date :return

      t.timestamps
    end
  end
end

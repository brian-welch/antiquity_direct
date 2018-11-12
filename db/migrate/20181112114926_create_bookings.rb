class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :check_out_date
      t.date :return_date
      t.references :user, foreign_key: true
      t.references :artifact, foreign_key: true

      t.timestamps
    end
  end
end

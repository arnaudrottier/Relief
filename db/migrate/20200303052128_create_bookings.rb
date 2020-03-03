class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :amenity, foreign_key: true
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end

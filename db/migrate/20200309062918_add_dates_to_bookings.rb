class AddDatesToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :start_date, :datetime
    add_column :bookings, :end_date, :datetime
    remove_column :bookings, :end_time, :time
    remove_column :bookings, :start_time, :time
  end
end

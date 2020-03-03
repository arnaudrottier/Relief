class RemoveAndAddColumnToBooking < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bookings, :user, index: true
    add_reference :bookings, :room, foreign_key: true
  end
end

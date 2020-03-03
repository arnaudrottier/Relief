class AddPeriodToRoomChores < ActiveRecord::Migration[5.2]
  def change
    add_column :room_chores, :period, :integer
    remove_column :room_chores, :start_date
    remove_column :room_chores, :end_date
  end
end

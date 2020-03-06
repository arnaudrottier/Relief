class AddStatusToRoomChores < ActiveRecord::Migration[5.2]
  def change
    remove_column :room_chores, :status
    add_column :room_chores, :status, :string, default: "pending"
  end
end


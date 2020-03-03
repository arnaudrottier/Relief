class AddDefaultToRoomChoresStatus < ActiveRecord::Migration[5.2]
  def change
    change_column_default :room_chores, :status, from: nil, to: false
  end
end

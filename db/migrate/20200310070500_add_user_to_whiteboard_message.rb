class AddUserToWhiteboardMessage < ActiveRecord::Migration[5.2]
  def change
    add_reference :whiteboard_messages, :user, foreign_key: true
  end
end

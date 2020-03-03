class CreateWhiteboardMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :whiteboard_messages do |t|
      t.text :message

      t.timestamps
    end
  end
end

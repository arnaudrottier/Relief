class AddPostDateToWhiteboardMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :whiteboard_messages, :post_date, :date
  end
end

class CreateRoomChores < ActiveRecord::Migration[5.2]
  def change
    create_table :room_chores do |t|
      t.boolean :status
      t.references :room, foreign_key: true
      t.references :chore, foreign_key: true
      t.text :notes
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end

class CreateChores < ActiveRecord::Migration[5.2]
  def change
    create_table :chores do |t|
      t.string :name
      t.text :description
      t.interval :frequency

      t.timestamps
    end
  end
end

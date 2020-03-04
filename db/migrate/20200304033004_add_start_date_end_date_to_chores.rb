class AddStartDateEndDateToChores < ActiveRecord::Migration[5.2]
  def change
     add_column :room_chores, :start_date, :date
     add_column :room_chores, :end_date, :date
  end
end

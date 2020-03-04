class AddPeriodToChores < ActiveRecord::Migration[5.2]
  def change
    add_column :chores, :period, :integer
  end
end

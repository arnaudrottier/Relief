class RemovePeriodFromChores < ActiveRecord::Migration[5.2]
  def change
    remove_column :chores, :period, :integer
  end
end

class AddDefaultFrequencyToChores < ActiveRecord::Migration[5.2]
  def change
    change_column_default :chores, :frequency, from: nil, to: 7.days
  end
end

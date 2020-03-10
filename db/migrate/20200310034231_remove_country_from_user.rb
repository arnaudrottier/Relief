class RemoveCountryFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :country, :integer
  end
end

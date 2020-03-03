class RemoveColumnToAmenityModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :amenities, :availability, :string
    remove_column :amenities, :boolean, :string
    add_column :amenities, :availability, :boolean
  end
end

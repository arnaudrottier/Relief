class AddFaClassToAmenities < ActiveRecord::Migration[5.2]
  def change
    add_column :amenities, :fa_class, :string
  end
end

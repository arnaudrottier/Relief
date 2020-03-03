class CreateAmenities < ActiveRecord::Migration[5.2]
  def change
    create_table :amenities do |t|
      t.string :name
      t.string :availability
      t.string :boolean

      t.timestamps
    end
  end
end

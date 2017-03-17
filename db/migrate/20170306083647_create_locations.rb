class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :place
      t.string :city
      t.string :state
      t.string :country
      t.float :lat
      t.float :lng
      t.timestamps
    end
  end
end

class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :title
      t.integer :user_id
      t.integer :status
      t.text :description
      t.timestamps
    end
  end
end

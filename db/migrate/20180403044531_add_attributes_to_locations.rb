class AddAttributesToLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :zip_code
      t.string :city
      t.string :state_abbreviation
      t.string :latitude
      t.string :longitude
      t.float :current_temperature_fahrenheit
      t.float :high
      t.float :low
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

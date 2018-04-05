class AddAttributesToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :state_abbreviation, :string
    add_column :locations, :city, :string
    add_column :locations, :latitude, :string
    add_column :locations, :longitude, :string
    add_column :locations, :current_temperature_fahrenheit, :float
    add_column :locations, :high, :float
    add_column :locations, :low, :float
  end
end

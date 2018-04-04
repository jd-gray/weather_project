class AddCurrentWeatherToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :current_temperature_fahrenheit, :float
  end
end

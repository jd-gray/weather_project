class AddHighAndLowToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :high, :float
    add_column :locations, :low, :float
  end
end

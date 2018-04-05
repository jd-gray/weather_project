class RenameCountryAbbrToStateAbbr < ActiveRecord::Migration[5.1]
  def change
    rename_column :locations, :country_abbreviation, :state_abbreviation
  end
end

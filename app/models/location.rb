class Location < ApplicationRecord
  validates_format_of :zip_code, :with => %r{\d{5}(-\d{4})?}, :message => "should be 12345 or 12345-1234"
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :state_abbreviation, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :current_temperature_fahrenheit, presence: true
  validates :high, presence: true
  validates :low, presence: true

  def average_temperature
    (high + low) / 2
  end
end

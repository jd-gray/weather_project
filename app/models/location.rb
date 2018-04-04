class Location < ApplicationRecord

  def average_temperature
    (high + low) / 2
  end

  def celcius_conversion(temperature)
    (temperature - 32) * 5.0 / 9.0
  end
end

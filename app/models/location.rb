class Location < ApplicationRecord

  def average_temperature
    (high + low) / 2
  end

end

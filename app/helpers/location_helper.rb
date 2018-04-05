module LocationHelper
  def celcius_conversion(temperature)
    ((temperature - 32) * 5.0 / 9.0).round(2)
  end
end

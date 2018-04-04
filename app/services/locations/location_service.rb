module Locations
  class LocationService
    def initialize(zip_code, user_id)
      @zip_code = zip_code
      @user_id = user_id
    end

    def create_location
      zip_code_data = get_zip_code
      weather_data = get_weather
      @location = Location.create!(
        zip_code: @zip_code,
        user_id: @user_id,
        country_abbreviation: zip_code_data[:country_abbreviation],
        city: zip_code_data[:city],
        latitude: zip_code_data[:latitude],
        longitude: zip_code_data[:longitude],
        current_temperature_fahrenheit: weather_data[:temperature_fahrenheit],
        high: weather_data[:high],
        low: weather_data[:low]
      )
    end

    private

    def get_zip_code
      Zippopotamus::Api::Client.get_zip_code(@zip_code)
    end

    def get_weather
      Weather::Api::Client.get_weather(@zip_code)
    end
  end
end

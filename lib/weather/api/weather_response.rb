require 'json'

module Weather
  module Api
    class WeatherResponse
      def initialize(response)
        @response = response
      end

      def parse
        @response.empty? ? '' : WeatherData.new(@response['query']['results']['channel']).to_h
      end

      WeatherData = Struct.new(:data) do
        def current_temperature
          data['item']['condition']['temp']
        end

        def to_h
          {
              current_temperature: current_temperature
          }
        end
      end
    end
  end
end

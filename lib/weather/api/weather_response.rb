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
        def temperature_fahrenheit
          data['item']['condition']['temp'].to_f
        end

        def description
          data['item']['description']
        end

        def daily_forecast
          data['item']['forecast'].select { |forecast| forecast['date'] == Date.today.strftime("%d %b %Y") }[0]
        end

        def high
          daily_forecast['high'].to_f
        end

        def low
          daily_forecast['low'].to_f
        end

        def to_h
          {
              temperature_fahrenheit: temperature_fahrenheit,
              description: description,
              daily_forecast: daily_forecast,
              high: high,
              low: low
          }
        end
      end
    end
  end
end

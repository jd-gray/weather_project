require_relative 'weather_response'

module Weather
  module Api
    class Client
      include HTTParty

      base_uri ENV['YAHOO_WEATHER_BASE_URI']

      def self.get_weather
        # yql = Yahoo Query Language
        yql_query = "select * from weather.forecast where woeid in (select woeid from geo.places(1) where placetype='zip' and text='85233')"

        request_query = { query: { q: yql_query } }
        request = get('/v1/public/yql', request_query)
        WeatherResponse.new(request).parse
      end
    end
  end
end

module Weather
  module Api
    class Client
      include HTTParty

      base_uri ENV['YAHOO_WEATHER_BASE_URI']

      def self.get_weather
        yql_query = "select * from weather.forecast where woeid in (select woeid from geo.places(1) where placetype='zip' and text='92647')"
        @options = { query: { q: yql_query } }
        get('/v1/public/yql?', @options)
      end
    end
  end
end

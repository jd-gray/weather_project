require 'json'

module Zippopotamus
  module Api
    class ZippopotamusResponse
      def initialize(response)
        @response = response
      end

      def parse
        @response.empty? ? '' : ZippopotamusData.new(@response).to_h
      end

      ZippopotamusData = Struct.new(:data) do
        def zip_code
          data['post code']
        end

        def country_abbreviation
          data['country abbreviation']
        end

        def zip_code_data
          data['places'].first
        end

        def city
          zip_code_data['place name']
        end

        def latitude
          zip_code_data['latitude']
        end

        def longitude
          zip_code_data['longitude']
        end

        def to_h
          {
              zip_code: zip_code,
              country_abbreviation: country_abbreviation,
              city: city,
              latitude: latitude,
              longitude: longitude
          }
        end
      end
    end
  end
end

require_relative 'zippopotamus_response'

module Zippopotamus
  module Api
    class Client
      include HTTParty

      base_uri ENV['ZIPPOPOTAMUS_BASE_URI']

      def self.get_zip_code(zip_code)
        request = get("/us/#{zip_code}")
        ZippopotamusResponse.new(request).parse
      end
    end
  end
end

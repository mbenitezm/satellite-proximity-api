# frozen_string_literal: true

module SpaceX
  # Client that retrieves data from space x api
  class Client
    class << self
      def retrieve_data
        satelite_data.map do |raw_data|
          Satellite.new(raw_data).to_hash
        end
      end

      private

      def satelite_data
        response = RestClient.get ENV['SPACEX_API_URL']
        JSON.parse(response.body)
      end
    end
  end
end

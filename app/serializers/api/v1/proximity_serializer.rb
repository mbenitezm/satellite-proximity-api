# frozen_string_literal: true

# Serializer for proximity controller index response
module Api
  module V1
    class ProximitySerializer < ActiveModel::Serializer
      attributes(*%i[
                   satellites
                 ])

      def satellites
        object.map { |satellite| SatelliteSerializer.new(satellite) }
      end
    end
  end
end

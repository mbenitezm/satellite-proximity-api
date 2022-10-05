# frozen_string_literal: true

# Satelite model serializer
module Api
  module V1
    class SatelliteSerializer < ActiveModel::Serializer
      attributes(*%i[
                   name
                   lat
                   lon
                   updated_at
                 ])
    end
  end
end

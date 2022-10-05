# frozen_string_literal: true

module SpaceX
  # Contract for data received from spacex api that will be saved to the DB
  class Satellite
    attr_accessor :name, :lat, :lon

    def initialize(data)
      @name = data.dig('spaceTrack', 'OBJECT_NAME')
      @lat = data.fetch('latitude')
      @lon = data.fetch('longitude')
    end

    def to_hash
      { name:, lat:, lon: }
    end
  end
end

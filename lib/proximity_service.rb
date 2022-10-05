# frozen_string_literal: true

require 'haversine'

# Service in charge of returning satellites ordered by proximity of a given lat, lon point
class ProximityService
  class << self
    def closest_satellites(lat, lon, limit = 5)
      sorted_satellites(lat, lon).first(limit)
    end

    private

    # I would test that this methods returns an array of correctly measured distances
    def sorted_satellites(lat, lon)
      Satellite.active.sort_by do |satellite|
        current_position = [lat, lon]
        satellite_position = [satellite.lat, satellite.lon]
        Haversine.distance(current_position, satellite_position).to_miles
      end
    end
  end
end

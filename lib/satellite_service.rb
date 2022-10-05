# frozen_string_literal: true

# Class that chooses a satellite service to retrieve data. For now we only have one service implementation
class SatelliteService
  class << self
    def retrieve_data
      service.retrieve_data
    end

    private

    def service
      SpaceX::Client
    end
  end
end

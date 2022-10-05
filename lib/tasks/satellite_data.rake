# frozen_string_literal: true

namespace :satellite_data do
  task refresh: :environment do
    data = SatelliteService.retrieve_data
    Satellite.upsert_all(data)
  end
end

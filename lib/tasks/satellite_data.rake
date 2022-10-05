# frozen_string_literal: true

namespace :satellite_data do
  task refresh: :environment do
    data = SatelliteService.retrieve_data.uniq { |satellite| [satellite[:name]]}
    Satellite.upsert_all(data, unique_by: :name)
  end
end

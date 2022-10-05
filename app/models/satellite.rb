class Satellite < ApplicationRecord
  scope :active, -> { where("lat IS NOT NULL AND lon IS NOT NULL") }
end

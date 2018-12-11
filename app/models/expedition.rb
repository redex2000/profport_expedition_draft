class Expedition < ApplicationRecord
  has_many :available_spaceships, -> { where working: true }, class_name: "Spaceship"
  has_many :stock_spaceships, -> { where working: false }, class_name: "Spaceship"
  has_many :spaceships, -> { extending FindRecent }
  has_one :itinerary

end

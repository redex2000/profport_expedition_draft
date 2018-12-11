class Expedition < ApplicationRecord
  has_many :spaceships
  has_one :itinerary
  has_many :assemblies, through: :spaceships

end

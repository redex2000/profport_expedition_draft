class Expedition < ApplicationRecord
  has_many :spaceships
  has_one :itinerary
end

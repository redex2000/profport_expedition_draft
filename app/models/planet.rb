class Planet < ApplicationRecord
  has_many :itinerary_planets
  has_many :itineraries, through: :itinerary_planets
end

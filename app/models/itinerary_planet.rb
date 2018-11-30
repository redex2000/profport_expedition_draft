class ItineraryPlanet < ApplicationRecord
  belongs_to :itinerary
  belongs_to :planet
end

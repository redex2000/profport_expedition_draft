class Itinerary < ApplicationRecord
  belongs_to :expedition
  has_many :itinerary_planets
  has_many :planets, through: :itinerary_planets
end

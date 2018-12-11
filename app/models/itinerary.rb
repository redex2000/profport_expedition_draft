class Itinerary < ApplicationRecord
  belongs_to :expedition
  has_many :itinerary_planets
  has_many :planets, through: :itinerary_planets,
           after_add: :increment_length,
           after_remove: :decrement_length


  private


  def increment_length(planet)
    route_length_old = route_length.to_f
    update_column(:route_length, route_length_old + planet.distance)
  end


  def decrement_length(planet)
    route_length_old = route_length.to_f
    update_column(:route_length, route_length_old - planet.distance)
  end
end

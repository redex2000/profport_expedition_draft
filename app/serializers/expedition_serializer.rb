class ExpeditionSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :price

  attribute :route_length do |object|
    object.itinerary.planets.inject(0) { |result, planet| result + planet.distance }
  end

  has_many :spaceships
end
module Types
  class ExpeditionType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :spaceships, [Types::SpaceshipType], null: true, description: "Корабли данной экспедиции"
  end
end

module Types
  class SpaceshipType < Types::BaseObject
    field :title, GraphQL::Types::String, null: false
    field :velocity, GraphQL::Types::Float, null: false
  end
end

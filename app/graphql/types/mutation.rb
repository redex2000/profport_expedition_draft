module Types
  class Mutation < Types::BaseObject
    field :create_expedition, mutation: Mutations::CreateExpedition
  end
end

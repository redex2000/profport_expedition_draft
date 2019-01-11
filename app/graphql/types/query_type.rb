module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :expedition, Types::ExpeditionType, null: false do
      argument :id, ID, required: true
    end

    def expedition(id: )
      Expedition.find(id)
    end
  end
end

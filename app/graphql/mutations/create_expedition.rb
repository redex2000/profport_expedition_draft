module Mutations
  class CreateExpedition < BaseMutation
    argument :title, String, required: true

    field :expedition, Types::ExpeditionType, null: true
    field :errors, [String], null: false

    def resolve(title: )
      expedition = Expedition.new title: title
      if expedition.save
        {
            expedition: expedition,
            errors: []
        }
      else
        {
            expedition: nil,
            errors: expedition.errors.full_messages
        }
      end
    end
  end
end

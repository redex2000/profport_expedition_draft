class AddDescriptionToExpeditions < ActiveRecord::Migration[5.2]
  def change
    add_column :expeditions, :description, :text
  end
end

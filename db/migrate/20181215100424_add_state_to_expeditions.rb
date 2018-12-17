class AddStateToExpeditions < ActiveRecord::Migration[5.2]
  def change
    add_column :expeditions, :state, :integer, default: 0
  end
end

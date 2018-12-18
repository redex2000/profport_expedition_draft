class AddPriceToExpeditions < ActiveRecord::Migration[5.2]
  def change
    add_column :expeditions, :price, :float, default: 100.0
  end
end

class CreateExpeditions < ActiveRecord::Migration[5.2]
  def change
    create_table :expeditions do |t|
      t.string :title

      t.timestamps
    end
  end
end

class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.string :title
      t.belongs_to :spaceship, foreign_key: true

      t.timestamps
    end
  end
end

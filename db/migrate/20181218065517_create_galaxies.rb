class CreateGalaxies < ActiveRecord::Migration[5.2]
  def change
    create_table :galaxies do |t|
      t.string :title

      t.timestamps
    end
  end
end

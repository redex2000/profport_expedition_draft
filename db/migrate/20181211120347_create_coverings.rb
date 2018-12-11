class CreateCoverings < ActiveRecord::Migration[5.2]
  def change
    create_table :coverings do |t|
      t.string :title

      t.timestamps
    end
  end
end

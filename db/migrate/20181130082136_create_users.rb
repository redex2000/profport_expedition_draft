class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fio
      t.integer :age
      t.belongs_to :expedition, foreign_key: true

      t.timestamps
    end
  end
end

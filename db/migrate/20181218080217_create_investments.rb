class CreateInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :investments do |t|
      t.belongs_to :expedition, foreign_key: true
      t.belongs_to :investor, foreign_key: true
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end

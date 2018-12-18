class CreateInvestors < ActiveRecord::Migration[5.2]
  def change
    create_table :investors do |t|
      t.string :fio

      t.timestamps
    end
  end
end

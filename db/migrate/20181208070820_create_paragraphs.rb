class CreateParagraphs < ActiveRecord::Migration[5.2]
  def change
    create_table :paragraphs do |t|
      t.string :title
      t.boolean :published, default: false
      t.belongs_to :book, foreign_key: true, index: true

      t.timestamps
    end
  end
end

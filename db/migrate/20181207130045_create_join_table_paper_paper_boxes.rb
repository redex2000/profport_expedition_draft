class CreateJoinTablePaperPaperBoxes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :paper_boxes, :papers do |t|
      t.index :paper_box_id
      t.index :paper_id
    end
  end
end

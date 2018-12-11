class AddTypeIdDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :details, :part_id, :integer
    add_column :details, :part_type, :string
  end
end

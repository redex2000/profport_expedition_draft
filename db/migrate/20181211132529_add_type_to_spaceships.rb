class AddTypeToSpaceships < ActiveRecord::Migration[5.2]
  def change
    add_column :spaceships, :type, :string
  end
end

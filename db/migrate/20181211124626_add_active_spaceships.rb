class AddActiveSpaceships < ActiveRecord::Migration[5.2]
  def change
    add_column :spaceships, :working, :boolean, default: true
  end
end

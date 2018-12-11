class AddRouteLengthToItineraries < ActiveRecord::Migration[5.2]
  def change
    add_column :itineraries, :route_length, :float
  end
end

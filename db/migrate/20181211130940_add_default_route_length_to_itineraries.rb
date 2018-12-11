class AddDefaultRouteLengthToItineraries < ActiveRecord::Migration[5.2]
  def change
    change_column_default :itineraries, :route_length, from: nil, to: 0.0
  end
end

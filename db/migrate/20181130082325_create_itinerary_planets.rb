class CreateItineraryPlanets < ActiveRecord::Migration[5.2]
  def change
    create_table :itinerary_planets do |t|
      t.belongs_to :itinerary, foreign_key: true
      t.belongs_to :planet, foreign_key: true

      t.timestamps
    end
  end
end

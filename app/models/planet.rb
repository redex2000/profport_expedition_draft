class Planet < ApplicationRecord
  def self.default_scope
    order(updated_at: :desc)
  end

  scope :recent, ->(datetime) { where('created_at > ?', datetime) }
  scope :far, -> { where('distance > 5') }

  has_many :itinerary_planets
  has_many :itineraries, through: :itinerary_planets

  def change
    with_lock do
      update title: 'Плутон'
    end
  end
end

class Expedition < ApplicationRecord
  has_many :available_spaceships, -> { where working: true }, class_name: "Spaceship"
  has_many :stock_spaceships, -> { where working: false }, class_name: "Spaceship"
  has_many :spaceships, -> { extending FindRecent }
  has_one :itinerary

  validates :title, presence: true

  after_create :create_assoc

  enum state: [:initiated, :started, :finished]

  def create_assoc
    create_itinerary route_length: 150
  end

end

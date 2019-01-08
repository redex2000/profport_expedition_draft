class Expedition < ApplicationRecord
  default_scope { order updated_at: :desc }

  has_many :available_spaceships, -> { where working: true }, class_name: "Spaceship"
  has_many :stock_spaceships, -> { where working: false }, class_name: "Spaceship"
  has_many :spaceships, dependent: :destroy
  has_one :itinerary, dependent: :destroy
  has_many :investments
  has_many :investors, through: :investments
  has_many :users

  validates :title, presence: true

  after_create :create_assoc

  enum state: [:initiated, :started, :finished]

  private

  def create_assoc
    create_itinerary route_length: 150
  end



end

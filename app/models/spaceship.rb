class Spaceship < ApplicationRecord
  belongs_to :expedition
  has_many :details, inverse_of: :mechanism
  has_many :skins, through: :details, source: :part, source_type: "Covering"
  has_many :motors, through: :details, source: :part, source_type: "Engine"


end

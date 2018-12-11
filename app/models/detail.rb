class Detail < ApplicationRecord
  belongs_to :part, polymorphic: true
  belongs_to :spaceship
end

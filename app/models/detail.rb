class Detail < ApplicationRecord
  belongs_to :part, polymorphic: true
  belongs_to :mechanism, class_name: "Spaceship", foreign_key: "spaceship_id"
end

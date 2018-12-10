class Paper < ApplicationRecord
  has_and_belongs_to_many :paper_boxes
end

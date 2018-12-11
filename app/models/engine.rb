class Engine < ApplicationRecord
  has_one :detail, as: :part
end

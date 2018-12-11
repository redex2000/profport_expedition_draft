class Covering < ApplicationRecord
  has_one :detail, as: :part
end

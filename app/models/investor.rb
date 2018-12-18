class Investor < ApplicationRecord
  has_many :investments
  has_many :expeditions, through: :investments
end

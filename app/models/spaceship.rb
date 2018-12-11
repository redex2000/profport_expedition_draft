class Spaceship < ApplicationRecord
  belongs_to :expedition
  has_many :parts, class_name: "Detail"

  before_destroy :test

  private

  def test
    puts "Уничтожаемся!"
  end
end

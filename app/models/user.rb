class User < ApplicationRecord
  belongs_to :expedition, optional: true

  validates :email, uniqueness: true, format: { with: /\A\w+@\w+\.\w{2,6}\z/ }
  validates :password, length: { in: 6..20 }, confirmation: true

  def password_valid?(out_password)
    password == out_password
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :expedition, optional: true

  validates :email, uniqueness: true, format: { with: /\A\w+@\w+\.\w{2,6}\z/ }
  validates :password, length: { in: 6..20 }, confirmation: true

  enum role: %I[cosmonaut boss]

end

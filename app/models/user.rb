class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :expedition, optional: true

  validates :email, uniqueness: true, format: { with: /\A\w+@\w+\.\w{2,6}\z/ }

  enum role: %I[cosmonaut boss]

  before_create :set_auth_token

  private

  def set_auth_token
    self.auth_token = Devise.friendly_token
  end

end

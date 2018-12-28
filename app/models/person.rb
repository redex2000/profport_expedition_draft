class Person
  include ActiveModel::SecurePassword

  attr_accessor :email, :title

  has_secure_password

  attr_accessor :password_digest

end
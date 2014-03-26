class User < ApplicationModel
  has_secure_password

  has_many :sign_ups

  validates(
    :email,
    presence:   true,
    uniqueness: true
  )

  validates(
    :password,
    length: { minimum: 8 }
  )
end

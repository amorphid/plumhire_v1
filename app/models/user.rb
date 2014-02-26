class User < ApplicationModel
  has_many :sign_ups

  validates :email,
            presence:   true,
            uniqueness: true
end

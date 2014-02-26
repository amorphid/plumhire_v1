class User < ApplicationModel
  validates :email,
            presence:   true,
            uniqueness: true
end

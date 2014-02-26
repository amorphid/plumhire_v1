class User < ApplicationModel
  validates :email,
            presence:   true,
            uniqueness: true

  validates :uuid,
            presence: true
end

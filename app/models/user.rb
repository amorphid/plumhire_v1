class User < ApplicationModel
  validates :email,
            presence: true
end

class SignUp < ApplicationModel
  validates :email,
            presence: true

  validates :uuid,
            presence: true,
            uniqueness: true
end

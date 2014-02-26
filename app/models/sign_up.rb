class SignUp < ApplicationModel
  validates :email,
            presence: true
end

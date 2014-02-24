class SignUp < ApplicationModel
  after_initialize :set_uuid

  validates :email,
            presence: true

  validates :uuid,
            presence: true,
            uniqueness: true
end

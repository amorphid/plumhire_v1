class SignUp < ActiveRecord::Base
  validates :email,
            presence: true,
            uniqueness: true

  validates :uuid, presence: true, uniqueness: true
end

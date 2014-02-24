class SignUp < ActiveRecord::Base
  validates :email,
            presence: true

  validates :uuid, presence: true, uniqueness: true
end

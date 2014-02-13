class SignUp < ActiveRecord::Base
  validates :email, presence: true
end

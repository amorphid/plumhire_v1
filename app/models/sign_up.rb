class SignUp < ActiveRecord::Base
  validates :uuid, presence: true, uniqueness: true
end

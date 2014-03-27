class SignUp < ApplicationModel
  belongs_to :user

  validates :email,
            presence: true

  def password
  end
end

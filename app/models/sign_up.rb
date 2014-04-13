class SignUp < ApplicationModel
  validates :email,
            presence: true

  # For use w/ esit sign up password form
  def password
  end
end



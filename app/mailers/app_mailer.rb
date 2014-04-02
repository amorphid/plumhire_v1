class AppMailer < ActionMailer::Base
  default from: "mpope.cr@gmail.com"

  def sign_up_password_edit(sign_up)
    @sign_up = sign_up
    @subject = "[Plumhire] Sign Up"

    mail(
      to:      @sign_up.email,
      subject: @subject
    )
  end
end

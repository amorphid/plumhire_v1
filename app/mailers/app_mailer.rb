class AppMailer < ActionMailer::Base
  default from: "mpope.cr@gmail.com"

  def set_password(sign_up)
    @sign_up = sign_up
    @subject = "[Plumhire] Set password to access account"

    mail(
      to: @sign_up.email,
      subject: @subject
    )
  end
end

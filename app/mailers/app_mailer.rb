class AppMailer < ActionMailer::Base
  default from: "mpope.cr@gmail.com"

  def set_password(sign_up)
    @sign_up = sign_up

    mail(
      to: @sign_up.email,
      subject: "[Plumhire] Please set password"
    )
  end
end

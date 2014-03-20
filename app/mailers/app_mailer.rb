class AppMailer < ActionMailer::Base
  default from: "mpope.cr@gmail.com"

  def create_password(sign_up)
    @s       = sign_up
    @subject = "[Plumhire] Sign Up / Step 2 of 3: Confirm email"

    mail(
      to:      @s.email,
      subject: @subject
    )
  end
end

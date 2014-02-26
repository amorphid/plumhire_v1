class SignUpsController < ApplicationController
  def new
    @s = SignUp.new
  end

  def show
    @s = SignUp.find_by(uuid: params[:id])
  end

  def update
    @s = SignUp.find_or_create_by(uuid: params_sign_up[:uuid])

    if @s.update(params_sign_up)
      # User.create(
      #   email: params_sign_up[:email],
      #   password: params_sign_up[:password]
      # ) unless @s.user

      send_set_password_email unless @s.email_sent_on
      flash[:notice] = "Confirmation email sent to " + @s.email
      redirect_to sign_up_path(@s)
    else
      render action: "new"
    end
  end

private

  def send_set_password_email
    AppMailer.delay.set_password(@s)
    @s.update(email_sent_on: DateTime.now)
  end

  def params_sign_up
    params[:sign_up].permit(:email, :uuid)
  end
end

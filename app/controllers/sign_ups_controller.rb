class SignUpsController < ApplicationController
  def new
    @sign_up = SignUp.new
  end

  def show
    @sign_up = SignUp.find_by(uuid: params[:id])
  end

  def update
    @sign_up = SignUp.find_or_create_by(uuid: params_sign_up[:uuid])

    if @sign_up.update(params_sign_up)
      User.create(
        email: params_sign_up[:email],
        password: params_sign_up[:password]
      ) unless @sign_up.user

      send_set_password_email unless @sign_up.email_sent_on
      flash[:notice] = "Confirmation email sent to " + @sign_up.email
      redirect_to sign_up_path(@sign_up)
    else
      render action: "new"
    end
  end

private

  def send_set_password_email
    AppMailer.delay.set_password(@sign_up)
    @sign_up.update(email_sent_on: DateTime.now)
  end

  def params_sign_up
    params[:sign_up].permit(:email, :uuid)
  end
end

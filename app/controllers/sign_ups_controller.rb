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
      send_email_unless
      flash[:notice] = set_notice
      redirect_to sign_up_path(@s)
    else
      render action: "new"
    end
  end

private

  def set_notice
    "Confirmation email sent to " + @s.email
  end

  def send_email_unless
    unless @s.email_sent_on
      AppMailer.delay.set_password(@s)
      @s.update(email_sent_on: DateTime.now)
    end
  end

  def params_sign_up
    params[:sign_up].permit(:email, :uuid)
  end
end

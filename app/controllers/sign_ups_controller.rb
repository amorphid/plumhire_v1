class SignUpsController < ApplicationController
  before_action :set_sign_up,
                only: [:email_sent, :set_password]

  def submit_email
    @s = SignUp.new
  end

  def set_password
  end

  def email_sent
  end

  def update
    @s = SignUp.find_or_create_by(uuid: params_sign_up[:uuid])

    if @s.update(params_sign_up)
      send_email_unless
      flash[:notice] = set_notice
      redirect_to email_sent_sign_up_path(@s)
    else
      render action: "submit_email"
    end
  end

private

  def set_notice
    "Confirmation email sent to " + @s.email
  end

  def set_sign_up
    @s = SignUp.find_by(uuid: params[:id])
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

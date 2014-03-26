class SignUpEmailsController < ApplicationController
  def new
    @s = SignUp.new
  end

  def show
    @s = SignUp.find_by(uuid: params[:id])
  end

  def update
    @s = SignUp.find_or_create_by(uuid: params[:id])

    if @s.update(sign_up_params)
      send_confirmation_if
      set_notice
      redirect_to sign_up_email_path(@s)
    else
      render action: "new"
    end
  end

  private

  def send_confirmation
    @s.update!(email_sent_on: DateTime.now)
    AppMailer.delay.sign_up_password_edit(@s)
  end

  def send_confirmation?
    unless(
      @s.email_sent_on &&
      sign_up_params[:email] == @s.email &&
      DateTime.now.to_i - @s.email_sent_on.to_i < 3
    )
      true
    else
      false
    end
  end


  def send_confirmation_if
    send_confirmation if send_confirmation?
  end

  def set_notice
    flash[:notice] = "Confirmation email sent to " + @s.email
  end

  def sign_up_params
    params[:sign_up].permit(:email, :uuid)
  end
end

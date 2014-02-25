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
      AppMailer.set_password(@sign_up).deliver
      @sign_up.update(email_sent_on: DateTime.now)
      flash[:notice] = "Confirmation email sent to " + @sign_up.email
      redirect_to sign_up_path(@sign_up)
    else
      render action: "new"
    end
  end

private

  def params_sign_up
    params[:sign_up].permit(:email, :uuid)
  end
end

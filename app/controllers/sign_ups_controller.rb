class SignUpsController < ApplicationController
  def new
    @sign_up = SignUp.new
  end

  def update
    @sign_up = SignUp.find_or_create_by(uuid: params_sign_up[:uuid])
    @sign_up.update(params_sign_up)
    redirect_to new_sign_up_path
  end

private

  def params_sign_up
    params[:sign_up].permit(:email, :uuid)
  end
end

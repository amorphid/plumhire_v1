class SignUpsController < ApplicationController
  def index
    @sign_up = SignUp.new
  end

  def update
    uuid     = params_sign_up[:uuid]
    @sign_up = SignUp.find_or_create_by(uuid: uuid)
    @sign_up.update_attributes(params_sign_up)
    redirect_to sign_ups_path
  end

private

  def params_sign_up
    params[:sign_up].permit(:email, :uuid)
  end
end

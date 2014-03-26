class SignUpPasswordsController < ApplicationController
  def edit
    @sign_up = SignUp.find_by(uuid: params[:id])
    @user    = User.new
  end

  def update
    @sign_up = SignUp.find_by(uuid: params[:id])
  end
end

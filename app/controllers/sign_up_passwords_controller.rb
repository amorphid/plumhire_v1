class SignUpPasswordsController < ApplicationController
  def edit
    @sign_up = SignUp.find_by(uuid: params[:id])
  end

  def update
    @sign_up = SignUp.find_by(uuid: params[:id])

    if params[:password]
      @user    = User.find_or_initialize_by(email: sign_up_params[:email])
      @user.password              = params[:password]
      @user.password_confirmation = params[:password]
      @user.save
    else
      render "edit"
    end
  end

  private

  def sign_up_params
    params[:sign_up].permit(:email)
  end
end

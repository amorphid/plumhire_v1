class SignUpPasswordsController < ApplicationController
  def edit
    @sign_up = SignUp.find_by(uuid: params[:id])
  end

  def update
    @sign_up = SignUp.find_by(uuid: params[:id])
    @user    = User.find_or_initialize_by(email: @sign_up.email)

    if @user.update(
      password:              sign_up_params[:password],
      password_confirmation: sign_up_params[:password]
    )
      session[:user_id] = @user.id
      flash[:success] = "You are now signed up & logged in :)"
      redirect_to user_home_page_path(@user)
    else
      render "edit"
    end
  end

  private

  def sign_up_params
    params[:sign_up].permit(:password)
  end
end

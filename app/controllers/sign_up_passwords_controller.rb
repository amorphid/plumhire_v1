class SignUpPasswordsController < ApplicationController
  def edit
    @sign_up = SignUp.find_by(uuid: params[:id])
  end

  def update
    @sign_up = SignUp.find_by(uuid: params[:id])
    @user    = User.find_or_initialize_by(email: @sign_up.email)

    if @user.update(
      password:              params[:password],
      password_confirmation: params[:password]
    )
      flash[:success] = "Sign Up successful, and you're now logged in, too!"
      redirect_to user_home_page_path(@user)
    else
      render "edit"
    end
  end
end

class SignInsController < ApplicationController
  def new
    @u = User.new
  end

  def update
    @u = User.find_or_initialize_by(email: user_params["email"])

    if @u.new_record? == false &&
       @u.authenticate(user_params["password"])
      session[:user_id] = @u.id
      flash[:success] = "You are now logged in :)"
      redirect_to user_home_page_path(@u)
    else
      @user_errors = set_user_errors
      render "new"
    end
  end

  private

  def set_user_errors
    case
    when @u.new_record? == false &&
         user_params["password"].length > 0
      flash[:exit_code] = "1"
      "That's the wrong password for \"#{user_params["email"]}\""
    when user_params["email"].length > 0
      flash[:exit_code] = "2"
      "\"#{user_params["email"]}\" doesn't belong to any account, but you can "
    else
      flash[:exit_code] = "3"
      arr  = []
      arr << "Email can't be blank"    if user_params["email"].blank?
      arr << "Password can't be blank" if user_params["password"].blank?
      arr << "Password is too short (minimum is 8 characters)" if
                (user_params["password"].length < 8)
      arr
    end
  end

  def user_params
    params[:user].permit(:email, :password)
  end
end





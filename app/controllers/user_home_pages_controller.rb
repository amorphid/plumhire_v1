class UserHomePagesController < ApplicationController
  def show
    @user = User.find_by(uuid: params[:id])
    redirect_to new_sign_in_path
  end
end

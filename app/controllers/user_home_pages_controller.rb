class UserHomePagesController < ApplicationController
  def show
    @user = User.find_by(uuid: params[:id])
  end
end

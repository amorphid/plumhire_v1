class UserHomePagesController < ApplicationController
  before_action :signed_in?

  def show
    @user = User.find_by(uuid: params[:id])
  end
end

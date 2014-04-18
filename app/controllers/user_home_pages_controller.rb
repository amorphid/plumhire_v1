class UserHomePagesController < ApplicationController
  before_action :authorize

  def show
    @user = User.find_by(uuid: params[:id])
  end
end

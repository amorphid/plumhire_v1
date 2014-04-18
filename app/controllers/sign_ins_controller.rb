class SignInsController < ApplicationController
  def new
    @u = User.new
  end

  def update
    @u = User.find_by(uuid: params[:id])
  end
end

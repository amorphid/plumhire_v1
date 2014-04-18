class SignInsController < ApplicationController
  def new
    @u = User.new
  end
end

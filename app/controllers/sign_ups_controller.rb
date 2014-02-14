class SignUpsController < ApplicationController
  def index
    @sign_up = SignUp.new
  end
end

class SignUpsController < ApplicationController
  def index
    sign_up   = SignUp.new
    decorator = ModelDecorator.new(sign_up)
    @sign_up  = decorator.response
  end
end

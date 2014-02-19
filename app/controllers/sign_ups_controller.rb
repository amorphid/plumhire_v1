class SignUpsController < ApplicationController
  def index
    @sign_up = SignUpConstructor.new.response
  end
end

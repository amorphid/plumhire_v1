class SignUpPasswordsController < ApplicationController
  def edit
    @sign_up = SignUp.find_by(uuid: params[:id])
  end
end

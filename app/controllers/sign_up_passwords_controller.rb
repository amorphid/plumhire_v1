class SignUpPasswordsController < ApplicationController
  def edit
    @s = SignUp.find_by(uuid: params[:id])
  end
end

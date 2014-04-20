class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def signed_in?
    unless current_user
      flash[:error] = "You just tried something that requires being signed in"
      redirect_to new_sign_in_path
    end
  end

  def current_user
    if User.exists? session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      session[:user_id] = nil
    end
  end
end

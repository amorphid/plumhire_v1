class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize
    redirect_to new_sign_in_path unless current_user
  end

  def current_user
    if User.exists? session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      session[:user_id] = nil
    end
  end
end

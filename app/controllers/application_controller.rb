class ApplicationController < ActionController::Base
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

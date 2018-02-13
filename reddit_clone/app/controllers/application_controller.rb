class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :logged_in?
  
  def current_user 
    current_user = User.find_by(session_token: session[:session_token])
  end 
  
  def logged_in?
    !!current_user
  end 
  
  def ensure_login 
    redirect_to new_session_url unless logged_in? 
  end 
end

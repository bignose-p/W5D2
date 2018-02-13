class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    
    if user 
      session[:session_token] = user.reset_session_token
      redirect_to subs_url
    else 
      flash.now[:errors] = ["Invalid Login Info"]
      render :new 
    end 
  end

  def destroy
    current_user.reset_session_token
    session[:session_token] = nil 
    redirect_to new_session_url
  end
end

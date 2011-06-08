class SessionsController < ApplicationController
  skip_before_filter :am_authorize

  layout :get_layout
  
  def new
  end

  def create
      
    if user = VwUser.authenticate(params[:user_name], params[:password])
      reset_session
      session[:user_uuid] = user.user_uuid
      #if user.days_until_password_expiry < 0
      #  flash[:notice] = "Password has expired, please update"
      #  redirect_to edit_vw_user_path(user)
      #else
        redirect_to :controller => "home"
      #end
    else
      session[:user_uuid] = nil
      redirect_to login_url, :notice => "Invalid logon"
    end
  end

  def destroy
    session[:user_uuid] = nil
    reset_session
    redirect_to login_url, :notice => "Logged out"
  end

  def get_layout
    if action_name == 'new'
      'login_page'
    elsif action_name == 'destroy'
      'logout_page'
    else
      'application'
    end
  end
end

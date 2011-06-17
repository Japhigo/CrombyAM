class SessionsController < ApplicationController
  skip_before_filter :am_authorize

  layout :get_layout
  
  def new
  end

  def create
      
    if user = VwUser.authenticate(params[:user_name], params[:password])
      if user.account_locked
        clear_session
        redirect_to login_url, :notice => "Your account has been locked, please contact your System Administrator"
      elsif user.days_until_password_expiry < 0
        clear_session
        flash[:notice] = "Password has expired, please update"
        redirect_to edit_vw_user_path(user)
      else
        reset_session
        session[:user_uuid] = user.user_uuid
        redirect_to :controller => "home"
      end
    else
      clear_session
      redirect_to login_url, :notice => "Invalid logon"
    end
  end

  def destroy
    clear_session
    redirect_to login_url, :notice => "Logged out"
  end

  def get_layout
    if action_name == 'new'
      'login_page'
    else
      'application'
    end
  end

private

  def clear_session
    session[:user_uuid] = nil
    reset_session  
  end

end

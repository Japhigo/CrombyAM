require 'cromby_auth'

class ApplicationController < ActionController::Base
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :am_authorize  
  helper_method :current_user
  
private

  def current_user
    @current_user ||= VwUser.find_by_user_uuid(session[:user_uuid]) if session[:user_uuid]
  end

  def am_authorize
    #if session[:user_uuid]
      authorization = CrombyAuth.authorize_user(session[:user_uuid], controller_name)
      auth_level = authorization[1]
    #else
    #  auth_level = -1
    #end 
    if auth_level == "-1"
      redirect_to login_path :notice => "Please log in."
    elsif auth_level == "0"
      flash[:notice] = "You do not have the permissions to use this function."
      redirect_to :back
    end
  end
  
end

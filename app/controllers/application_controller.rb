require 'cromby_auth'

class ApplicationController < ActionController::Base
  before_filter :am_authorize
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

protected

  def am_authorize
    authorization = CrombyAuth.authorize_user(session[:user_uuid], controller_name)
    user_name = authorization[0]
    auth_level = authorization[1]
    if user_name.nil?
      redirect_to login_url :notice => "Please log in."
    elsif auth_level != "1"
      flash[:notice] = "You do not have the permissions to use this function."
      redirect_to :back
    end
  end
end

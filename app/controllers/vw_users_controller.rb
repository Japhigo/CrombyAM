class VwUsersController < ApplicationController
  skip_before_filter :am_authorize

  layout :get_layout
  
  # GET /vw_users/1/edit
  def edit
    @vw_user = VwUser.find(params[:id])
  end

  # PUT /vw_users/1
  def update
    @vw_user = VwUser.find(params[:id])

    respond_to do |format|
      if @vw_user.update_attributes(params[:vw_user])
        reset_session
        session[:user_uuid] = @vw_user.user_uuid
        flash[:notice] = "Your password has been changed."
        format.html { redirect_to :controller => "home" }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def get_layout
    if action_name == 'edit'
      'login_page'
    else
      'application'
    end
  end
end

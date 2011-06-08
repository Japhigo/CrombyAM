class VwUsersController < ApplicationController
  # GET /vw_users
  # GET /vw_users.xml
  def index
    @vw_users = VwUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vw_users }
    end
  end

  # GET /vw_users/1
  # GET /vw_users/1.xml
  def show
    @vw_user = VwUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vw_user }
    end
  end

  # GET /vw_users/new
  # GET /vw_users/new.xml
  def new
    @vw_user = VwUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vw_user }
    end
  end

  # GET /vw_users/1/edit
  def edit
    @vw_user = VwUser.find(params[:id])
  end

  # POST /vw_users
  # POST /vw_users.xml
  def create
    @vw_user = VwUser.new(params[:vw_user])

    respond_to do |format|
      if @vw_user.save
        format.html { redirect_to(@vw_user, :notice => 'Viw user was successfully created.') }
        format.xml  { render :xml => @vw_user, :status => :created, :location => @vw_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vw_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vw_users/1
  # PUT /vw_users/1.xml
  def update
    @vw_user = VwUser.find(params[:id])

    respond_to do |format|
      if @vw_user.update_attributes(params[:vw_user])
        format.html { redirect_to(@vw_user, :notice => 'Viw user was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vw_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vw_users/1
  # DELETE /vw_users/1.xml
  def destroy
    @vw_user = VwUser.find(params[:id])
    @vw_user.destroy

    respond_to do |format|
      format.html { redirect_to(vw_users_url) }
      format.xml  { head :ok }
    end
  end
end

class RefDataTablesController < ApplicationController

  before_filter :find_ref_data_table, :only => [:show, :edit, :update]

  # GET /ref_data_tables
  # GET /ref_data_tables.xml
  def index
    @ref_data_tables = RefDataTable.all(:order => "table_name")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ref_data_tables }
    end
  end

  # GET /ref_data_tables/1
  # GET /ref_data_tables/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ref_data_table }
    end
  end

  # GET /ref_data_tables/1/edit
  def edit
    @ref_data_table.updated_by = current_user
  end

  # PUT /ref_data_tables/1
  # PUT /ref_data_tables/1.xml
  def update
    respond_to do |format|
      if @ref_data_table.update_attributes(params[:ref_data_table])
        format.html { redirect_to(@ref_data_table, :notice => 'Ref data table was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ref_data_table.errors, :status => :unprocessable_entity }
      end
    end
  end

private

  #DRY method to find an instance of RefDataTable
  def find_ref_data_table
    @ref_data_table = RefDataTable.find(params[:id])
  end

end

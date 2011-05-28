class RefDataTablesController < ApplicationController
  # GET /ref_data_tables
  # GET /ref_data_tables.xml
  def index
    @ref_data_tables = RefDataTable.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ref_data_tables }
    end
  end

  # GET /ref_data_tables/1
  # GET /ref_data_tables/1.xml
  def show
    @ref_data_table = RefDataTable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ref_data_table }
    end
  end

  # GET /ref_data_tables/new
  # GET /ref_data_tables/new.xml
  def new
    @ref_data_table = RefDataTable.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ref_data_table }
    end
  end

  # GET /ref_data_tables/1/edit
  def edit
    @ref_data_table = RefDataTable.find(params[:id])
  end

  # PUT /ref_data_tables/1
  # PUT /ref_data_tables/1.xml
  def update
    @ref_data_table = RefDataTable.find(params[:id])

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

end

class SubtypesController < ApplicationController
  sort "type"
  list_mode "3"

  layout "main"
  
  # GET /subtypes
  # GET /subtypes.xml
  def index
    @subtypes = Subtype.by_name

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subtypes }
    end
  end

  # GET /subtypes/1
  # GET /subtypes/1.xml
  def show
    @subtype = Subtype.find(params[:id])
    @miniatures = @subtype.miniatures.sorted(get_sort_field(params[:sort], "type")).with_include

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subtype }
    end
  end

  # GET /subtypes/new
  # GET /subtypes/new.xml
  def new
    @subtype = Subtype.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subtype }
    end
  end

  # GET /subtypes/1/edit
  def edit
    @subtype = Subtype.find(params[:id])
  end

  # POST /subtypes
  # POST /subtypes.xml
  def create
    @subtype = Subtype.new(params[:subtype])

    respond_to do |format|
      if @subtype.save
        flash[:notice] = 'Subtype was successfully created.'
        format.html { redirect_to(@subtype) }
        format.xml  { render :xml => @subtype, :status => :created, :location => @subtype }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subtype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subtypes/1
  # PUT /subtypes/1.xml
  def update
    @subtype = Subtype.find(params[:id])

    respond_to do |format|
      if @subtype.update_attributes(params[:subtype])
        flash[:notice] = 'Subtype was successfully updated.'
        format.html { redirect_to(@subtype) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subtype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subtypes/1
  # DELETE /subtypes/1.xml
  def destroy
    @subtype = Subtype.find(params[:id])
    @subtype.destroy

    respond_to do |format|
      format.html { redirect_to(subtypes_url) }
      format.xml  { head :ok }
    end
  end
end

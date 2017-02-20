class RaritiesController < ApplicationController
  list_mode "3"
  layout "main"
  
  # GET /rarities
  # GET /rarities.xml
  def index
    @rarities = Rarity.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rarities }
    end
  end

  # GET /rarities/1
  # GET /rarities/1.xml
  def show
    @rarity = Rarity.find(params[:id])
    @miniatures = @rarity.miniatures

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rarity }
    end
  end

  # GET /rarities/new
  # GET /rarities/new.xml
  def new
    @rarity = Rarity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rarity }
    end
  end

  # GET /rarities/1/edit
  def edit
    @rarity = Rarity.find(params[:id])
  end

  # POST /rarities
  # POST /rarities.xml
  def create
    @rarity = Rarity.new(params[:rarity])

    respond_to do |format|
      if @rarity.save
        flash[:notice] = 'Rarity was successfully created.'
        format.html { redirect_to(@rarity) }
        format.xml  { render :xml => @rarity, :status => :created, :location => @rarity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rarity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rarities/1
  # PUT /rarities/1.xml
  def update
    @rarity = Rarity.find(params[:id])

    respond_to do |format|
      if @rarity.update_attributes(params[:rarity])
        flash[:notice] = 'Rarity was successfully updated.'
        format.html { redirect_to(@rarity) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rarity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rarities/1
  # DELETE /rarities/1.xml
  def destroy
    @rarity = Rarity.find(params[:id])
    @rarity.destroy

    respond_to do |format|
      format.html { redirect_to(rarities_url) }
      format.xml  { head :ok }
    end
  end
end

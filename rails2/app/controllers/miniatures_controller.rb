class MiniaturesController < ApplicationController
  layout "main"

  before_filter :login_required, :only => [:add_tags, :delete_tags, :add_comment, :update_count]

  def update_count
    @miniature = Miniature.find(params[:id])
    @user = current_user
    ownership = Ownership.find_by_user_id_and_miniature_id(@user.id, @miniature.id) || Ownership.new
    ownership.user = @user
    ownership.miniature = @miniature
    ownership.have_count = params[:have_count]
    ownership.save!    
    redirect_to(miniature_path(@miniature))
  end
  
  def add_comment
    @miniature = Miniature.find(params[:id])
    comment = Comment.new(:title => params[:title], :comment => params[:comment])
    comment.user_id = current_user.id
    @miniature.comments << comment
    redirect_to(miniature_path(@miniature))
  end
  
  def add_tags
    @miniature = Miniature.find(params[:id])
    if params[:tags].present?
      tags = params[:tags].split(",")
      @miniature.tag_list.add(tags)
      @miniature.save
    end
    redirect_to(miniature_path(@miniature))
  end

  def delete_tags
    @miniature = Miniature.find(params[:id])
    if params[:tags].present?
      tags = params[:tags].split(",")
      @miniature.tag_list.remove(tags)
      @miniature.save
    end
    redirect_to(miniature_path(@miniature))
  end
  
    
  # GET /miniatures
  # GET /miniatures.xml
  def index
    @miniatures = Miniature.find(:all, :include => [:release, :rarity, :size, :type, :subtype, :source, :setting])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @miniatures }
    end
  end

  def challenge_ratings
    @challenge_ratings = [0.25, 0.33, 0.5, 1..40]
  end

  # GET /miniatures/1
  # GET /miniatures/1.xml
  def show
    @miniature = Miniature.find(params[:id])
    @comments = @miniature.comments
    @tags = @miniature.tags.sort_by {|tag| tag.name}
    @have_count = 0

    if logged_in?
      @ownership = current_user.ownerships.find_by_miniature_id(params[:id])
      if !@ownership.nil?
        @have_count = @ownership.have_count
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @miniature }
    end
  end

  # GET /miniatures/new
  # GET /miniatures/new.xml
  def new
    @miniature = Miniature.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @miniature }
    end
  end

  # GET /miniatures/1/edit
  def edit
    @miniature = Miniature.find(params[:id])
  end

  # POST /miniatures
  # POST /miniatures.xml
  def create
    @miniature = Miniature.new(params[:miniature])

    respond_to do |format|
      if @miniature.save
        flash[:notice] = 'Miniature was successfully created.'
        format.html { redirect_to(@miniature) }
        format.xml  { render :xml => @miniature, :status => :created, :location => @miniature }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @miniature.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /miniatures/1
  # PUT /miniatures/1.xml
  def update
    @miniature = Miniature.find(params[:id])

    respond_to do |format|
      if @miniature.update_attributes(params[:miniature])
        flash[:notice] = 'Miniature was successfully updated.'
        format.html { redirect_to(@miniature) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @miniature.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /miniatures/1
  # DELETE /miniatures/1.xml
  def destroy
    @miniature = Miniature.find(params[:id])
    @miniature.destroy

    respond_to do |format|
      format.html { redirect_to(miniatures_url) }
      format.xml  { head :ok }
    end
  end
end

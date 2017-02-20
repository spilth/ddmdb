class CollectionsController < ApplicationController
  include CollectionsHelper
  
  layout "main"

  skip_before_filter :admin_required

  def index
    user_id = params[:id]
    if user_id.nil?
      @user = current_user
    else
      @user = User.find(user_id)
    end
    unless @user
      flash[:error] = "Please log in before viewing your collection."
      redirect_to root_path and return
    end
    
    @miniatures = Miniature.find(:all, :order => "release_id, number", :include => [:release])
    @total = @user.ownerships.sum(:have_count)
  end
  
  def missing
    @user = current_user
    @miniatures = Miniature.find(:all, :order => "release_id, number", :include => [:release])
    @total = @user.ownerships.sum(:have_count)    
  end

  def update
    counts = params[:counts]
    unless counts.respond_to?(:collect)
      flash[:error] = "Unable to update collection; did you use the form?"
      redirect_to(:action => 'index') and return
    end
    user = current_user
    miniature_ids = counts.collect {|entry| entry[0] }.join(",")
    miniatures = Miniature.find(:all, :conditions => "miniatures.id in (#{miniature_ids})")

    Ownership.find_by_user_id(user.id)
    for miniature in miniatures
      set_count(user, miniature, counts["#{miniature.id}"].to_i)
    end
    
    flash[:notice] = "Collection updated!"

    redirect_to(:back)
  end

  def add_favorite
    if (user = current_user)
      miniature = Miniature.find(params[:id])
      set_favorite(user, miniature, true)
      redirect_to(:back)
    else
      flash[:error] = 'You must be logged in to add a favorite.'
      redirect_to root_path
    end
  end
  
  def remove_favorite
    if (user = current_user)
      miniature = Miniature.find(params[:id])
      set_favorite(user, miniature, false)
      redirect_to(:back)    
    else
      flash[:error] = 'You must be logged in to add a favorite.'
      redirect_to root_path
    end
  end

end

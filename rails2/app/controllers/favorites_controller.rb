class FavoritesController < ApplicationController
  skip_before_filter :admin_required

  sort "number"

  layout "main"
    
  def index
    user_id = params[:id]
    if user_id.nil?
      @user = current_user
    else 
      @user = User.find(user_id)
    end
    unless @user
      flash[:error] = "You must be signed in to view your favorites."
      redirect_to root_path and return
    end
    
    @miniatures = @user.favorites.sorted(get_sort_field(params[:sort], "number")).with_include
  end
    
end

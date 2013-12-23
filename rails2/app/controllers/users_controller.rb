class UsersController < ApplicationController
  skip_before_filter :admin_required

  layout "main"
  
  def index
    @users = User.paginate :page => params[:page], :order => 'created_at', :per_page => 25    
  end
  
  def show
    @user = User.find(params[:id])
    @comments = @user.comments
    @miniature_count = @user.ownerships.sum(:have_count)
    @favorites_count = @user.favorites.count
  end
  
  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

end

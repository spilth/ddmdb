class MiniaturesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update]
  before_filter :admin_only, only: [:new, :create]

  def index
    @miniatures = Miniature.order(:release_id, :number).includes(:release, :rarity, :type, :subtype, :size).decorate
  end

  def new
    @miniature = Miniature.new
  end

  def create
    Miniature.create(miniature_params)
    redirect_to miniatures_path
  end

  def show
    @miniature = Miniature.find(params[:id]).decorate
  end

  def update
    @miniature = Miniature.find(params[:id])
    success = @miniature.update_attributes(miniature_params)
    if success
      flash[:notice] = 'This miniature has been update.'
      redirect_to miniature_path(@miniature)
    end
  end

  private

  def miniature_params
    params.require(:miniature).permit(:name, :type_id, :subtype_id, :release_id, :number, :tag_list)
  end
end

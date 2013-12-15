class MiniaturesController < ApplicationController
  def index
    @miniatures = Miniature.order(:release_id, :number).includes(:release, :rarity, :type, :subtype, :size)
  end

  def new
    @miniature = Miniature.new
  end

  def create
    Miniature.create(miniature_params)
    redirect_to miniatures_path
  end

  def show
    @miniature = Miniature.find(params[:id])
  end

  private

  def miniature_params
    params.require(:miniature).permit(:name, :type_id, :subtype_id, :release_id, :number)
  end
end

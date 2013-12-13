class MiniaturesController < ApplicationController
  def index
    @miniatures = Miniature.all
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
    params.require(:miniature).permit(:name, :type_id, :subtype_id)
  end
end

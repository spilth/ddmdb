class SizesController < ApplicationController
  def index
    @sizes = Size.order(:id)
  end

  def new
    @size = Size.new
  end

  def create
    Size.create(size_params)
    redirect_to sizes_path
  end

  def show
    @size = Size.find(params[:id])
  end

  private

  def size_params
    params.require(:size).permit(:name, :abbreviation)
  end
end

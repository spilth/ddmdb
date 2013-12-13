class SubtypesController < ApplicationController
  def index
    @subtypes = Subtype.all
  end

  def new
    @subtype = Subtype.new
  end

  def create
    Subtype.create(subtype_params)
    redirect_to subtypes_path
  end

  def show
    @subtype = Subtype.find(params[:id])
  end

  private

  def subtype_params
    params.require(:subtype).permit(:name)
  end
end

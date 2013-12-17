class SubtypesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
  before_filter :admin_only, only: [:new, :create]

  def index
    @subtypes = Subtype.order(:name)
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

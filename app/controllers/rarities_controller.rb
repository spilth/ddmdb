class RaritiesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
  before_filter :admin_only, only: [:new, :create]

  def index
    @rarities = Rarity.order(:id)
  end

  def new
    @rarity = Rarity.new
  end

  def create
    Rarity.create(rarity_params)
    redirect_to rarities_path
  end

  def show
    @rarity = Rarity.find(params[:id])
  end

  private

  def rarity_params
    params.require(:rarity).permit(:name, :abbreviation)
  end
end

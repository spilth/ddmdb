class RaritiesController < ApplicationController
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

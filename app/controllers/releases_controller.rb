class ReleasesController < ApplicationController
  def index
    @releases = Release.all
  end

  def new
    @release = Release.new
  end

  def create
    Release.create(release_params)
    redirect_to releases_path
  end

  def show
    @release = Release.find(params[:id])
  end

  private

  def release_params
    params.require(:release).permit(:name, :abbreviation, :count)
  end
end

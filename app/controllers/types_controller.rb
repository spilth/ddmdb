class TypesController < ApplicationController
  def index

  end

  def new
    @type = Type.new
  end

  def create
    redirect_to types_path
  end
end

class TagsController < ApplicationController
  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @miniatures = Miniature.tagged_with(@tag.name)
  end
end

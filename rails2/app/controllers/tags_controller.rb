class TagsController < ApplicationController
  sort "name"
  list_mode "3"
  
  layout "main"

  def index
    @tags = Miniature.tag_counts.sort_by {|tag| tag.name}
    @taggings = Tagging.find(:all, :order => "created_at DESC", :limit => 25)
  end

  def help
  end
  
  def show
    @tag = params[:id]
    @miniatures = Miniature.with_include.sorted(get_sort_field(params[:sort], "name")).find_tagged_with(@tag, :match_all => true)
  end

end

class SearchController < ApplicationController
  sort "name"
  list_mode "3"
  
  layout "main"
  
  before_filter :set_sort_variables, :only => [:by_name]
  before_filter :set_list_mode, :only => [:by_name]
  
  def index
  end
  
  def by_name
    @name = params[:name] || ''

    if @name.length < 3
      flash[:error] = "Search terms must be at least 3 characters long."
    else
      @miniatures = Miniature.with_include.sorted(get_sort_field(params[:sort], "name")).search(@name)
    end
  end
end

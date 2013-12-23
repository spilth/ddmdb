class LeadersController < ApplicationController
  sort "leader"
  list_mode "4"
  
  before_filter :set_sort_variables, :only => [:index]
  before_filter :set_list_mode, :only => [:index]

  layout "main"
  
  def index
    @miniatures = Miniature.leaders.sorted(get_sort_field(params[:sort], "level")).with_include4
  end

end

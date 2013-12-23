class LevelsController < ApplicationController
  sort "level"
  list_mode "4"

  layout "main"
  
  def index
    @levels = (1..40).to_a
  end

  def show
    @level = level_constraint(params[:id].to_i)
    @miniatures = Miniature.level(@level).sorted(get_sort_field(params[:sort], "level")).with_include
  end
  
  private
  
  def level_constraint(i)
    [[1, i].max, 40].min
  end

end

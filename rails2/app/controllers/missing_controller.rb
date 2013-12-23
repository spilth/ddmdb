class MissingController < ApplicationController
  layout "main"
  sort "name"
  list_mode "3"

  def index    
  end

  def size
    @attribute = "Size"
    @miniatures = Miniature.sizeless.sorted(get_sort_field(params[:sort], "name")).with_include
    render :template => 'missing/missing'
  end

  def release
    @attribute = "Release"
    @miniatures = Miniature.releaseless.sorted(get_sort_field(params[:sort], "name")).with_include
    render :template => 'missing/missing'
  end
  
  def rarity
    @attribute = "Rarity"
    @miniatures = Miniature.rarityless.sorted(get_sort_field(params[:sort], "name")).with_include
    render :template => 'missing/missing'
  end
    
  def source
    @attribute = "3rd Edition Source"
    @miniatures = Miniature.sourceless.sorted(get_sort_field(params[:sort], "name")).with_include
    render :template => 'missing/missing'
  end

  def source2
    @attribute = "4th Edition Source"
    @miniatures = Miniature.source2less.sorted(get_sort_field(params[:sort], "name")).with_include
    render :template => 'missing/missing'
  end

  def typ
    @attribute = "3rd Edition Type"
    @miniatures = Miniature.typeless.sorted(get_sort_field(params[:sort], "name")).with_include
    render :template => 'missing/missing'
  end

  def subtype
    @attribute = "Subtype"
    @miniatures = Miniature.subtypeless.sorted(get_sort_field(params[:sort], "name")).with_include
    render :template => 'missing/missing'
  end

  def cr
    @attribute = "Challenge Rating"
    @miniatures = Miniature.crless.sorted(get_sort_field(params[:sort], "name")).with_include
    render :template => 'missing/missing'
  end

  def level
    @attribute = "Level"
    @miniatures = Miniature.leveless.sorted(get_sort_field(params[:sort], "name")).with_include
    render :template => 'missing/missing'
  end

  def difficulty
    @attribute = "Difficulty"
    @miniatures = Miniature.difficultyless.sorted(get_sort_field(params[:sort], "name")).with_include
    render :template => 'missing/missing'
  end

  def role
    @attribute = "Role"
    @miniatures = Miniature.roleless.sorted(get_sort_field(params[:sort], "name")).with_include
    render :template => 'missing/missing'
  end

  def origin
    @attribute = "Origin"
    @miniatures = Miniature.originless.sorted(get_sort_field(params[:sort], "name")).with_include
    render :template => 'missing/missing'
  end

  def kind
    @attribute = "4th Edition Type"
    @miniatures = Miniature.kindless.sorted(get_sort_field(params[:sort], "name")).with_include
    render :template => 'missing/missing'
  end
  
end

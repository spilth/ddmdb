# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  @@default_sort = "name"
  @@default_list_mode = 3
  
  helper :all # include all helpers, all the time

  include AuthenticatedSystem

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '6fd3e58713fabff47a0d34204bd98ec9'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  before_filter :admin_required, :only => [:new, :edit, :create, :update, :destroy]
  before_filter :set_sort_variables, :only => [:show]
  before_filter :set_list_mode, :only => [:show]

  private

  SORT_FIELDS = {
    "name" => "miniatures.name",
    "number" => "releases.id, miniatures.number",
    "cr" => "miniatures.challenge_rating, miniatures.name",
    "source" => "sources.name, miniatures.source_page_number, miniatures.name",
    "source2" => "sources.name, miniatures.source2_page_number, miniatures.name",
    "type" => "types.name, subtypes.name",
    "size" => "sizes.id, miniatures.name",
    "setting" => "sources.name, miniatures.name",
    "level" => "miniatures.level, difficulties.id, roles.name, origins.name, kinds.name",
    "difficulty" => "difficulties.id, roles.name, origins.name, kinds.name, miniatures.name",
    "role" => "roles.name, difficulties.id, miniatures.leader",
    "leader" => "miniatures.leader, difficulties.id, roles.name, origins.name, kinds.name",
    "origin" => "origins.name, kinds.name, miniatures.name",
    "kind" => "kinds.name, origins.name, difficulties.id, roles.name"
  }

  SORT_DESCRIPTIONS = {
    "name" => "Name",
    "number" => "Release and Number",
    "cr" => "Challenge Rating and Name",
    "source" => "Source, Page Number and Name",
    "type" => "Type and Subtype",
    "size" => "Size and Name",
    "setting" => "Source and Name",
    "level" => "Level, Difficulty, Role, Origin and Type",
    "difficulty" => "Difficulty, Role, Origin, Type and Name",
    "role" => "Role, Difficulty and Leader",
    "leader" => "Leader, Difficulty, Role, Origin and Type",
    "origin" => "Origin, Type and Name",
    "kind" => "Type, Origin, Difficulty and Role", 
    "source2" => "Source, Page Number and Name"
  }
  
  def self.sort(sort)
    @@default_sort = sort
  end

  def self.list_mode(list_mode)
    @@default_list_mode = list_mode
  end

  def ensure_dracosaurus
    if request.env['HTTP_HOST'] !~ /dracosaur/
      redirect_to 'http://dracosaur.us/'
    end
  end
    
  def set_sort_variables
    @sort = params[:sort] || @@default_sort
    @sort_description = get_sort_description(@sort, "name")
    @sort_field = get_sort_field(@sort, "name")
  end

  def get_sort_description(sort, default_value) 
    sort ||= default_value
    return SORT_DESCRIPTIONS[sort] || SORT_DESCRIPTIONS[default_value]
  end
    
  def get_sort_field(sort, default_value)
    sort ||= default_value
    SORT_FIELDS[sort] || SORT_FIELDS[default_value]
  end

  def set_list_mode
    @list_mode = params[:list_mode] || @@default_list_mode
  end

end

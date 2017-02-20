class DefaultController < ApplicationController
  layout "main"
  
  def index
    @edits = Miniature.find(:all, :order => "updated_at DESC", :limit => 25)
  end
  
end

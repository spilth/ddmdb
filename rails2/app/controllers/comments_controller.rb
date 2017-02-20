class CommentsController < ApplicationController
  layout "main"
  
  def index
    @comments = Comment.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(:back) }
      format.xml  { head :ok }
    end

  end
  
end

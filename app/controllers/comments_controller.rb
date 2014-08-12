class CommentsController < ApplicationController
  before_filter :load_commentable
  
  def index
    @comments = @commentable.comments
  end

  def show
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.html {render :layout => !request.xhr? }
      format.js { render :js => @comment}
    end  
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = "Successfully created comment."
      #redirect_to @comment.commentable
      redirect_to post_path(@comment.commentable)
    else
      redirect_to :back, :errors => "Not created"
    end
  end  

  private
  def load_commentable
    resource = request.path.split('/')[1]
    id = request.path.split('/')[2]
  end
end

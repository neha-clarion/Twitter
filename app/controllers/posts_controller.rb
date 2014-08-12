class PostsController < ApplicationController
  def index
    @posts = Post.where(:user_id => current_user.id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end  
  end

  def show
    @post = Post.find(params[:id])
    @profile = Profile.find_by_user_id(current_user.id)
    @commentable = @post
    @comment = @commentable.comments.new
    @comments = @post.comments.order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|    
      format.html 
      format.json { render json: @post}
    end
  end

  def new
    @post = Post.new
    @profile = Profile.find_by_user_id(current_user.id)
    respond_to do |format|
      format.html 
      format.json { render json: @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
    @profile = Profile.find_by_user_id(current_user.id)
  end

  def create
    @post = Post.new(params[:post])
    @profile = Profile.find_by_user_id(current_user.id)
    @post.user_id = current_user.id
      if @post.save
        redirect_to home_detail_path
      else
        render action: "new" 
      end
    end  

  def update
    @post = Post.find(params[:id])
    @profile = Profile.find_by_user_id(current_user.id)
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to home_detail_path, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to home_detail_path }
      format.json { head :no_content }
    end
  end
end

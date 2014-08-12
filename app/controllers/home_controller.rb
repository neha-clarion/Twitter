class HomeController < ApplicationController
  def detail
    @profile = Profile.find_by_user_id(current_user.id)
    @post = Post.new
    user_ids = current_user.followed_users.map(&:id) + [current_user.id]
    @posts = Post.where(:user_id => user_ids).order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
  end
end
  

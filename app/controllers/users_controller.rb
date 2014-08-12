class UsersController < ApplicationController
  def following
    @post = Post.new
    @user = User.find(params[:id])
    @profile = @user.profile
    @users = @user.followed_users.paginate(:page => params[:page], :per_page => 5)
    render 'show_follow'
  end

  def followers
    @profile = Profile.find_by_user_id(current_user.id)
    @post = Post.new
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page], :per_page => 5)
    render 'show_follow'
  end
end
 
class FriendshipsController < ApplicationController
  def follow
    @friendship = Friendship.new(followed_id: params[:id], :follower_id => current_user.id)
    @friendship.save
    redirect_to profile_path(@friendship.followed.profile)
  end
  
  def unfollow
    @friendship = current_user.friendships.where(followed_id: params[:followed_id]).first
    @friendship.destroy
    redirect_to profile_path(@friendship.followed.profile)
  end    
end

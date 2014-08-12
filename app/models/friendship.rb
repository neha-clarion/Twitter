class Friendship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  attr_accessible :followed_id, :follower_id
end

class User < ActiveRecord::Base
  has_one :profile
  has_many :posts
  has_many :comments
  has_many :friendships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :friendships, source: :followed
  has_many :reverse_friendships, foreign_key: "followed_id",
                                   class_name: "Friendship",
                                   dependent:  :destroy
  has_many :followers, through: :reverse_friendships, source: :follower
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  after_save :build_profile
  def build_profile
    Profile.new(user_id: id).save(validate: false) if Profile.where("user_id = ?",id).blank? # Associations must be defined correctly for this syntax, avoids using ID's directly.
  end

  def following?(user)
    friendships.where(followed_id: user.id).first
  end 
  #def profile_name
    #User.profile.name    
  #end
end

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable,dependent: :destroy
  attr_accessible :blog, :user_id
  validates :blog, presence: true, length: { maximum: 140, minimum: 2 }
  validates :user_id, presence: true
end
  
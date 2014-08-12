class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :photo, :styles => {
                    :thumb => "75x75",
                    :small => "250x200",
                    :middium => "350x350",
                    :large => "450x450",
                    }, 
                    :default_url => "/assets/:style/missing.jpeg"
                    
  attr_accessible :bio, :location, :mobile_number, :name, :profile_name, :website, :user_id, :country, :carrier, :photo
  attr_accessor :email
  validates :bio,length: { maximum: 50 }
  validates :name, :location, :profile_name,:country, :carrier, presence: true
  #validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                               #uniqueness: true
  validates :name, length: { maximum: 20 }
  validates :location, length: { maximum: 30 }
  validates :mobile_number, length: { maximum: 12, minimum:10 }, numericality: { only_integer: true }
  #validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg','image/png']
end
  
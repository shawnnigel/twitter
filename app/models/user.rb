class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, #:confirmable,
         :recoverable, :rememberable, :trackable, :validatable
 
  has_many :tweets, dependent: :destroy
  has_many :messages, dependent: :destroy
  mount_uploader :image, ImageUploader
  acts_as_followable
  acts_as_follower

def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end

  
end

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, #:confirmable,
         :recoverable, :rememberable, :trackable, :validatable
 
  has_many :tweets, dependent: :destroy
  mount_uploader :image, ImageUploader
  acts_as_followable
  acts_as_follower
end

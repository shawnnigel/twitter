class Tweet < ActiveRecord::Base
	belongs_to :user #,dependent: :destroy
	

  validates :content, length: { maximum: 140 }
  validates_presence_of :content
#mount_uploader :image, ImageUploader
end

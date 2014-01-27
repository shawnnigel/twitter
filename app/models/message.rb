class Message < ActiveRecord::Base
	belongs_to :user
	validates :content, length: { maximum: 500 }
  validates_presence_of :content
end

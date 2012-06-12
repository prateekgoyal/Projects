class Comment < ActiveRecord::Base
	attr_accessible :commenter, :body
  	belongs_to :post
	validates :commenter, :body, :presence => true
	belongs_to :user
end

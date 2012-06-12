class Post < ActiveRecord::Base
  attr_accessible :name, :title, :content
  validates :name, :presence => true
  validates :title, :presence => true
  has_many :comments, :dependent => :destroy
  belongs_to :user
  default_scope :order => 'created_at DESC'
end

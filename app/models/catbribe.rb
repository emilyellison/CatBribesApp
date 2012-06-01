class Catbribe < ActiveRecord::Base
  attr_accessible :caption, :image, :member_id
  belongs_to :member
  has_many :ratings
  
  mount_uploader :image, ImageUploader
  
  validates :image, presence: true
  validates :caption, presence: true
  validates :member_id, presence: true
  
end

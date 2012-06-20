class Catbribe < ActiveRecord::Base
  attr_accessible :caption, :image, :cat_id
  belongs_to :cat
  has_many :ratings
  
  mount_uploader :image, ImageUploader
  
  validates :caption, presence: true
  validates :cat_id, presence: true
  validates :image, presence: true

  
end

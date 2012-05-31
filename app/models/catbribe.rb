class Catbribe < ActiveRecord::Base
  attr_accessible :caption, :image, :member_id
  belongs_to :member
  
  mount_uploader :image, ImageUploader
  
end

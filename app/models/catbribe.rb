class Catbribe < ActiveRecord::Base
  attr_accessible :caption, :image, :member_id
  belongs_to :member
  has_many :ratings
  
  mount_uploader :image, ImageUploader
  
  validates :caption, presence: true
  validates :member_id, presence: true
  
  validate :image?

  def image?
    if @original_filename == nil
      errors.add(:image, "must not be blank.")
    end
  end
  
end

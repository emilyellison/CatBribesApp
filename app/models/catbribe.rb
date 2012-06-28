require 'file_size_validator'

class Catbribe < ActiveRecord::Base
  attr_accessible :caption, :image, :cat_id, :member_id
  belongs_to :cat
  belongs_to :member
  has_many :ratings
  
  mount_uploader :image, ImageUploader
 
  validates :caption, presence: true
  validates :cat_id, presence: true
  validates :image,
      :presence => true,
      :file_size => { 
        :maximum => 0.6.megabytes.to_i
      }
  

  def average_rating
    latest_ratings = []
    ratings.order('created_at asc').group_by(&:member_id).each do |x, y|
      latest_ratings << y.last.bribes
    end
    if latest_ratings.present?
      average_rating = (latest_ratings.sum + 0.0) / latest_ratings.count
    else
      average_rating = 0
    end
    return average_rating
  end
  
end

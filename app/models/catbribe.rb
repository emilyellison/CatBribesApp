class Catbribe < ActiveRecord::Base
  attr_accessible :caption, :image, :cat_id
  belongs_to :cat
  has_many :ratings
  
  mount_uploader :image, ImageUploader
  
  validates :caption, presence: true
  validates :cat_id, presence: true
  validates :image, presence: true

  def average_rating
    latest_ratings = []
    ratings.order('created_at asc').group_by(&:member_id).each do |x, y|
      latest_ratings << y.last.bribes
    end
    average_rating = (latest_ratings.sum + 0.0) / latest_ratings.count
  end
  
end

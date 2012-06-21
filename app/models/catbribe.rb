class Catbribe < ActiveRecord::Base
  attr_accessible :caption, :image, :cat_id
  belongs_to :cat
  has_many :ratings
  
  mount_uploader :image, ImageUploader
  
  validates :caption, presence: true
  validates :cat_id, presence: true
  validates :image, presence: true

  # def average_rating
  #    latest_ratings = ratings.find(:all, 
  #      group: 'member_id'
  #    )
  #    rating_sum = 0
  #    latest_ratings.each do |rating|
  #      rating_sum += rating.bribes
  #    end
  #    average_rating = (rating_sum + 0.0) / latest_ratings.count
  #    return average_rating
  #  end
  
end

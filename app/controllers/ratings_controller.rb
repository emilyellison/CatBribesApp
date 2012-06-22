class RatingsController < ApplicationController
  
  before_filter :logged_in_member
  
  def create
    @rating = Rating.new(params[:rating])
    @rating.save
    
    @new_catbribes = Catbribe.order('created_at desc')
    @catbribes = Catbribe.all
    @popular_catbribes = Catbribe.all.sort_by { |x| -x.average_rating }
    if @current_member
      @preloaded_ratings = []
      Rating.order('created_at asc').where('member_id = ?', @current_member.id).group_by(&:catbribe_id).each do |x, y|
        @preloaded_ratings << y.last
      end
    end
  end
  
end
class RatingsController < ApplicationController
  
  before_filter :logged_in_member
  
  def create
    @rating = Rating.new(params[:rating])
    @rating.save
  end
  
end
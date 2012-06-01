class RatingsController < ApplicationController
  
  before_filter :logged_in_member, only: [ :create ]
  
  def create
    @rating = Rating.new(params[:rating])
    @rating.save
  end
  
end
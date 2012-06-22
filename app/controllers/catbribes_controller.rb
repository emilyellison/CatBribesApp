class CatbribesController < ApplicationController
  
  before_filter :logged_in_member, only: [ :new, :create ]
  
  def index
    @new_catbribes = Catbribe.order('created_at desc')
    @catbribes = Catbribe.all
    @popular_catbribes = Catbribe.all.sort_by { |x| -x.average_rating }
    @rating = Rating.new
    if @current_member
      @preloaded_ratings = []
      Rating.order('created_at asc').where('member_id = ?', @current_member.id).group_by(&:catbribe_id).each do |x, y|
        @preloaded_ratings << y.last
      end
    end
  end
  
  def new
    @catbribe = Catbribe.new
  end
  
  def create
    @catbribe = Catbribe.new(params[:catbribe])
    @catbribe.member_id = session[:mid]
    respond_to do |format|
      if @catbribe.save
        format.html { 
          flash[:success] = 'Congrats on adding your CatBribe!'
          redirect_to root_url 
        }
        format.js
      else
        format.html { render :new }
      end
    end
  end
  
end
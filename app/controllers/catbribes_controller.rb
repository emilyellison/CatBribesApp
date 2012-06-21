class CatbribesController < ApplicationController
  
  before_filter :logged_in_member, only: [ :create ]
  
  def index
    @new_catbribes = Catbribe.order('created_at desc')
    @catbribes = Catbribe.all
    @rating = Rating.new
    @preloaded_ratings = Rating.all(:select => "*, max(created_at)", :group => :catbribe_id) 
  end
  
  def new
    @catbribe = Catbribe.new
  end
  
  def create
    @catbribe = Catbribe.new(params[:catbribe])
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
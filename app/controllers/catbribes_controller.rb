class CatbribesController < ApplicationController
  
  before_filter :logged_in_member, only: [ :create ]
  
  def index
    @catbribes = Catbribe.all
    @catbribe = Catbribe.new
    @rating = Rating.new
  end
  
  def create
    @catbribe = Catbribe.new(params[:catbribe])
    @catbribe.member_id = session[:mid]
    respond_to do |format|
      if @catbribe.save
        format.html { redirect_to root_url, notice: 'Congrats on adding your CatBribe!' }
        format.js
      else
        format.html { render action: 'new' }
      end
    end
  end
  
end
class CatbribesController < ApplicationController
  
  before_filter :logged_in_member, except: [ :index ]
  
  def index
    @catbribes = Catbribe.all
  end
  
  def new
    @catbribe = Catbribe.new
  end
  
  def create
    @catbribe = Catbribe.new(params[:catbribe])
    @catbribe.member_id = session[:mid]
    if @catbribe.save
      redirect_to root_url, notice: 'Congrats on adding your CatBribe!'
    else
      flash.now[:notice] = 'Invalid image/caption.'
      render :new
    end
  end
  
end
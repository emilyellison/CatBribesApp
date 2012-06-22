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
          redirect_to member_url(session[:mid]) 
        }
        format.js
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
    member_match(session[:mid], Catbribe.find_by_id(params[:id]).member_id)
    @catbribe = Catbribe.find_by_id(params[:id])
  end
  
  def update
    member_match(session[:mid], Catbribe.find_by_id(params[:id]).member_id)
    @catbribe = Catbribe.find_by_id(params[:id])
    @catbribe.update_attributes(params[:catbribe])
    if @catbribe.save
      flash[:success] = 'Your CatBribe has been updated successfully.'
      redirect_to member_url(session[:mid])
    else
      render :edit
    end
  end
  
  def destroy
    member_match(session[:mid], Catbribe.find_by_id(params[:id]).member_id)
    @catbribe = Catbribe.find_by_id(params[:id])
    @catbribe.destroy
    flash[:success] = 'Your CatBribe has been deleted successfully.'
    redirect_to member_url(session[:mid])
  end
  
end
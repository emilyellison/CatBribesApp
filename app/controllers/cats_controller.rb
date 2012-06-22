class CatsController < ApplicationController
  
  before_filter :logged_in_member, except: [ :show ]
  
  def new
    @cat = Cat.new
  end
  
  def create
    @cat = Cat.new(params[:cat])
    if @cat.save 
      @cat_member = CatMember.new
      @cat_member.cat_id = @cat.id
      @cat_member.member_id = session[:mid]
      if @cat_member.save
        flash[:success] = "#{@cat.name} has been added to your profile!"
        redirect_to member_url(@current_member.id)
      else
        render :new
      end
    else
      render :new
    end
  end
  
  def show
    @auth = []
    CatMember.find_all_by_id(Cat.find_by_id(params[:id])).each do |catmember|
    	if catmember.member_id == session[:mid]
    		@auth << true 
      end
    end
    @cat = Cat.find_by_id(params[:id])
    @rating = Rating.new
    if @current_member
      @preloaded_ratings = []
      Rating.order('created_at asc').where('member_id = ?', @current_member.id).group_by(&:catbribe_id).each do |x, y|
        @preloaded_ratings << y.last
      end
    end
  end
  
  def edit
    auth = []
    CatMember.find_all_by_cat_id(Cat.find_by_id(params[:id]).id).each do |catmember|
    	if catmember.member_id == session[:mid]
    		auth << true 
      end
    end
    if auth.blank?
      flash[:error] = 'You were not authorized to view that page.'
      redirect_to member_url(session[:mid])
    else
      @cat = Cat.find_by_id(params[:id])
    end
  end
  
  def update
    auth = []
    CatMember.find_all_by_cat_id(Cat.find_by_id(params[:id]).id).each do |catmember|
    	if catmember.member_id == session[:mid]
    		auth << true 
      end
    end
    if auth.blank?
      flash[:error] = 'You were not authorized to view that page.'
      redirect_to member_url(session[:mid])
    else
      @cat = Cat.find_by_id(params[:id])
      @cat.update_attributes(params[:cat])
      if @cat.save
        flash[:success] = "#{@cat.name} has been updated sucessfully."
        redirect_to member_url(@current_member.id)
      else
        render :edit
      end
    end
  end
  
  def destroy
    auth = []
    CatMember.find_all_by_cat_id(Cat.find_by_id(params[:id]).id).each do |catmember|
    	if catmember.member_id == session[:mid]
    		auth << true 
      end
    end
    if auth.blank?
      flash[:error] = 'You were not authorized to view that page.'
      redirect_to member_url(session[:mid])
    else
      @cat = Cat.find_by_id(params[:id])
      @cat.destroy
    end
  end
  
end
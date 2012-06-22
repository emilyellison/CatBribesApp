class CatsController < ApplicationController
  
  before_filter :logged_in_member
  
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
    @cat = Cat.find_by_id(params[:id])
  end
  
  def update
    @cat = Cat.find_by_id(params[:id])
    @cat.update_attributes(params[:cat])
    if @cat.save
      flash[:success] = "#{@cat.name} has been updated sucessfully."
      redirect_to member_url(@current_member.id)
    else
      render :edit
    end
  end
  
  def destroy
    @cat = Cat.find_by_id(params[:id])
    @cat.destroy
  end
  
end
class MembersController < ApplicationController

  before_filter :logged_in_member, only: [ :show, :edit, :update ]
  before_filter :logged_out_member, only: [ :new, :create ]

  def new
    @member = Member.new
  end
  
  def create
    @member = Member.new(params[:member])
    if @member.save
      session[:mid] = @member.id
      redirect_to root_url, notice: "Congrats on becoming a member of CatBribes, #{@member.first}!"
    else
      render :new
    end
  end
  
  def show
    @member = Member.find_by_id(params[:id])
    @rating = Rating.new
    if @current_member
      @preloaded_ratings = []
      Rating.order('created_at asc').where('member_id = ?', @current_member.id).group_by(&:catbribe_id).each do |x, y|
        @preloaded_ratings << y.last
      end
    end
  end
  
  def edit
    @member = Member.find_by_id(params[:id])
  end
  
  def update
    @member = Member.find_by_id(params[:id])
    @member.update_attributes(params[:member])
    if @member.save
      flash[:success] = 'Your profile has been updated!'
      redirect_to member_url(@member.id)
    else
      render :edit
    end
  end
  
end

class MembersController < ApplicationController

  before_filter :logged_in_member, only: [ :show ]

  def new
    @member = Member.new
  end
  
  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to root_url, notice: "Congrats on becoming a member of CatBribes, #{@member.first}!"
    else
      render :new
    end
  end
  
  def show
    @member = Member.find_by_id(params[:id])
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

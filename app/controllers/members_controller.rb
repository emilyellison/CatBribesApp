class MembersController < ApplicationController

  before_filter :logged_in_member, only: [ :show ]

  def new
    @member = Member.new
  end
  
  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to root_url, notice: "Congrats on your CatBribes membership, #{@member.first}!"
    else
      render :new
    end
  end
  
  def show
    @member = Member.find_by_id(params[:id])
  end
  
end

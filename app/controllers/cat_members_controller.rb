class CatMembersController < ApplicationController
  
  def new
    @cat_member = CatMember.new
  end
  
  def create
    @cat_member = CatMember.new(params[:cat_member])
    if @cat_member.save
      flash[:success] = "#{Member.find_by_id(params[:cat_member][:member_id]).full_name} is now authorized to edit and post CatBribes of #{Cat.find_by_id(params[:cat_member][:cat_id]).name}!"
      redirect_to member_url(session[:mid])
    else
      render :new
    end
  end
  
end
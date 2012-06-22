class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :find_logged_in_member
  
  def find_logged_in_member
    @current_member = Member.find_by_id(session[:mid])
  end
  
  def logged_in_member
    if @current_member.nil?
      flash[:error] = 'You must be signed in first.' 
      redirect_to new_session_url, notice: 'You must be signed in first.'
    end
  end
  
  def logged_out_member
    if @current_member.present?
      flash[:error] = 'You must be signed out first.' 
      redirect_to member_url(@current_member.id)
    end
  end
  
  def member_match(member1_id, member2_id)
    if @current_member.present? && member1_id != member2_id
      flash[:error] = 'You were not authorized to view that page.'
      redirect_to member_url(session[:mid])
    end
  end
end

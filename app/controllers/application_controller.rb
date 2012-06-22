class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :find_logged_in_member
  
  def find_logged_in_member
    @current_member = Member.find_by_id(session[:mid])
  end
  
  def logged_in_member
    redirect_to new_session_url, notice: 'You must be signed in first.' if @current_member.nil?
  end
  
  def logged_out_member
    redirect_to member_url(@current_member.id), notice: 'You must be signed out first.' if @current_member.present?
  end
end

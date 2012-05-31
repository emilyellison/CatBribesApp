class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    member = Member.find_by_email(params[:email].downcase)
    if member && member.authenticate(params[:password])
      session[:mid] = member.id
      redirect_to root_url, notice: "Welcome, #{member.first}!"
    else
      flash.now[:notice] = 'Invalid email/password.'
      render :new
    end
  end
  
  def destroy
    reset_session
    redirect_to root_url, notice: 'Come back soon!'
  end
  
end
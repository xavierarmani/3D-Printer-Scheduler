#controlls the loging in of users and admins
class SessionsController < ApplicationController
  def login
  end
  
  def home
  end
  
  def profile
  end
  
  def setting
  end
  
  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    
    # checks to see if credentials belong to an admin
    if authorized_user.try(:admin?)
      redirect_to(sessions_user_path)
    
    # allows only approved users to log in
    elsif authorized_user && authorized_user.approval == true
      flash[:notice] = "Welcome again, last login was for #{authorized_user.userName}"
      redirect_to(schedules_path)

    else
      flash[:notice] = "Invalid Username, Password, or approval still pending"
      flash[:color]= "invalid"
      render "new"	

    end
  end
end
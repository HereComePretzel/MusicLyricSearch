class SessionsController < ApplicationController
  def new

  end

  def create
    
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Incorrect username/password"
      redirect_to new_login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to home_path
  end
end

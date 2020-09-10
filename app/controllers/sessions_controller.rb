class SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:new, :create]

  def reset_page_count
    session.delete(:page_count)
    redirect_back fallback_location: home_path
  end

  def new
    
  end
  
  def create
    @user = User.find_by(username: params[:session][:username])
    
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
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

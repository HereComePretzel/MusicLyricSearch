class ApplicationController < ActionController::Base
    # before_action :authorized
    helper_method :logged_in_user, :logged_in?, :authorized

    def logged_in_user
        if session[:user_id]
            User.find_by(id:session[:user_id]) 
        end
    end

    def authorized 
        redirect_to new_login_path unless logged_in_user
    end

    def logged_in?
        !!logged_in_user
    end
end

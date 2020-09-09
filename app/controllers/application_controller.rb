class ApplicationController < ActionController::Base
    before_action :current_user

    def current_user
        @user = (User.find_by(id:session[:user_id]) || User.new)
    end
end

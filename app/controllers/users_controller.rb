class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        @user.destroy
        # puts "Bruh, for real? Are you sure?"
        # case destroy
        # when Yes
        #     @user.destroy
        # when No
        #     redirect_to user_path(@user)
        # end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :age, :country, :img_url)
    end

end

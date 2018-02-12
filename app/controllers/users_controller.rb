class UsersController < ApplicationController
    before_action :set_user, only: [:show]

    def index
        @users = User.all
    end

    def show
        @message = params[:message] if params[:message]

        if session[:user_id] != @user.id
            redirect_to root_path
        end
    end
    

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :email, :zoo_id)
    end
end

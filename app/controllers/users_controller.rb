class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]

    def index
        @users = User.all
    end

    def show
        @message = params[:message] if params[:message]

        if session[:user_id] != @user.id
            redirect_to root_path
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Welcome to your Zoo!"
            redirect_to user_path(@user)
        else
            redirect_to root_path
        end
    end
    
    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to @user
        else
            render :edit
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

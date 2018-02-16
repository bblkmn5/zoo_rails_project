class UsersController < ApplicationController

    # def index
    #     @users = User.all
    # end

    def show
        @user = User.find(params[:id])
    end
    
    # def facebook_register
    #     @form = Zoo.create!(params[:zoo])
    #     if @form.valid?
    #         zoo_id = params[:zoo][:id]
    #         @user = User.from_omniauth(session["devise.facebook_data"], zoo_id)
    #         if @user.persisted?
    #             sign_in_and_redirect @user, :event => :authentication
    #                 set_flash_message(:notice, :success, :kind => "Facebook")
    #         else
    #             redirect_to new_user_registration_path
    #         end
    #     else
    #         render 'omniauth_callbacks/twitter', layout: 'none'
    #     end
    # end

    # private

    # def set_user
    #     @user = User.find(params[:id])
    # end

    # def user_params
    #     params.require(:user).permit(:name, :password, :password_confirmation, :email, :zoo_id)
    # end
end

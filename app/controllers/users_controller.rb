# Controller to view User page
class UsersController < ApplicationController
  before_action :authenticate_user!
  # def index
  #     @users = User.all
  # end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :uid, :provider, :email, :password, :password_confirmation, zoo_attributes: %i[name animal_capacity keeper_capacity user_id])
  end
end

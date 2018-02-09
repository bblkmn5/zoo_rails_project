class SessionsController < ApplicationController
  require 'pry'
  def new
    @user = User.new
  end

  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end

    session[:user_id] = @user.id
      binding.pry
    render 'static/home' 
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end

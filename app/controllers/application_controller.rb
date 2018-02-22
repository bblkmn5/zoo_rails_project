class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def after_sign_in_path_for(resource)
    request.env['omniauth.orgin'] || @user
  end 

end

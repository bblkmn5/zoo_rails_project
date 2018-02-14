class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :authenticate_user!, only: [:show]
  
  def after_sign_in_path_for(resource)
    request.env['omniauth.orgin'] || current_user.zoo || @user
  end 
  

  #def logged_in?
  #  !!session[:user_id]
  # end 

  protected

  def configure_permitted_parameters
    added_attrs = [:zoo_id]
    devise_parameter_sanitizer.permit(:signup, keys: [added_attrs])

    devise_parameter_sanitizer.permit(:account_update, keys: [added_attrs])
  end

  # def require_logged_in
  #   redirect_to root_path unless logged_in?
  # end
end

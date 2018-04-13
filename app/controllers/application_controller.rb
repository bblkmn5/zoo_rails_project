# Set up Devise and OAuth
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(_resource)
    request.env['omniauth.orgin'] || @user
  end
  
  private

  def user_is_current_user
    if current_user.id == params[:user_id].to_i || current_user.zoo_ids.include?(params[:zoo_id])
      true
    else
      flash[:alert] = 'You may only view your own zoo items.'
      if !current_user.nil?
        redirect_to user_path(current_user)
      else
        redirect_to root_path
      end
    end
  end
end

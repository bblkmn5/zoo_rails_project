class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]
    # skip_before_action :require_no_authentication

    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])
        # where(provider: auth.provider, uid: auth.uid).first_or_create

        # if @user.persisted? && @user.zoo_id.blank?
        #     redirect_to new_zoo_path
            sign_in_and_redirect @user, :event => :authentication
            set_flash_message(:notice, :success, :kind => "Facebook")
        # else
        #     session["devise.facebook_data"] = request.env["omniauth.auth"]
        #     redirect_to new_user_registration_url
         
            # @form = Zoo.new
            # session["devise.facebook_data"] = request.env["omniauth.auth"]
            # render 'zoos/new'
        # end
    end

    # def github
    #     @user = User.from_omniauth(request.env["omniauth.auth"])
    #     # if @user.persisted?
    #         sign_in_and_redirect @user
    #         # , :event => :authentication
    #         # set_flash_message(:notice, :success, :kind => "Github")
    #     # else
    #     #     session["devise.github_data"] = request.env["omniauth.auth"]
    #     #     redirect_to new_user_registration_url
    #     # end
    # end

    def failure
        redirect_to root_path
    end
     

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
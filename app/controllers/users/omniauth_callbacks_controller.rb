class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

 def facebook
    # Attempt to find the User
    @user = User.find_for_facebook_oauth(
    request.env["omniauth.auth"]
    )

    if @user.persisted?
    flash[:notice] = "Has ingresado via Facebook"
    sign_in_and_redirect @user, :event => :authentication
    else
    redirect_to new_user_registration_url
    end
  end


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

class Devise::CallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :login_required!

  def sso
    user = User.from_sso(request.env["omniauth.auth"])
    sign_in_and_redirect user
  end
end

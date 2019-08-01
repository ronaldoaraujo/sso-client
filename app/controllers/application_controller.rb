class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :login_required!

def login_required!
    if !current_user
      respond_to do |format|
        format.js  {
          render js: "window.location = '/'"
        }
        format.html  {
          redirect_to '/users/auth/sso'
        }
        format.json {
          render :json => { 'error' => 'Access Denied' }.to_json
        }
      end
    end
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    "http://localhost:3000"
  end
end

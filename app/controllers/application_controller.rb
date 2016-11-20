class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  #Redirecting the user to sing-in page if he is trying to access internal links
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to login_path, :notice => 'Please login first!'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role] )
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end
end

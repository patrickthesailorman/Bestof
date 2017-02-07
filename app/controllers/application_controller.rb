class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :authenticate_user!, except: [:home, :about, :posts]

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :username ])
   devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :username])
  end

end

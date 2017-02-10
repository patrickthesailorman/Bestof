class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  #before_action :authenticate_user!, except: [:home, :about, :posts]
  #include CanCan::ControllerAdditions #for using rails-API
  rescue_from CanCan::AccessDenied do |exception|
   redirect_to main_app.root_path, :alert => exception.message

 end
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :username ])
   devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :username])
   devise_parameter_sanitizer.for(:sign_up)  { |u| u.permit(  :email, :password, :password_confirmation, roles: [] ) }
  end

end

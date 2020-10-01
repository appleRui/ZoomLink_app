class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
<<<<<<< HEAD
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password ,:password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password ,:remember_me])
=======
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :remember_me])
>>>>>>> 36acdd735d694584b2463fafa8e58cb3f3433a32
  end

  def after_sign_in_path_for(resource)
    lists_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end

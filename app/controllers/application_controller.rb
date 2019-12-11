class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_devise_params, if: :devise_controller?

  protected

  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :photo])
  end
end

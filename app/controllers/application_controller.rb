class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_admin!
    unless current_user.admin
      flash[:error] = "Unprevilaged access"
      sign_out current_user
      redirect_to new_user_session_user_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :terms])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end

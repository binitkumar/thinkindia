class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  skip_before_action :verify_authenticity_token, if: :api_request?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to main_app.root_url
  end

  def api_request?
    request.fullpath.include?("/api/")
  end

  def authenticate_admin!
    unless current_user.admin
      flash[:error] = "Unprevilaged access"
      sign_out current_user
      redirect_to new_user_session_user_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :terms, :about_me, :allow_promotional_messages])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :about_me, :profile_pic])
  end
end

class LoginsController < ApplicationController
  def new
  end

  def create
    if user = authenticate_with_google
      flash[:alert] = "Signed in successfully"
      sign_in_and_redirect user 
    else
      redirect_to new_user_session_url, alert: 'authentication_failed'
    end
  end

  private
    def authenticate_with_google
      if id_token = flash[:google_sign_in_token]
        google_user = GoogleSignIn::Identity.new(id_token)
        user = User.find_by google_id: google_user.user_id
        unless user
          pass = Devise.friendly_token[0,20]
          user = User.find_or_create_by(email: google_user.email_address) do |usr|
            usr.name = google_user.name
            usr.password = pass
            usr.password_confirmation = pass
            usr.confirmed_at = Time.now
            usr.google_id = google_user.user_id
          end
        end
        user
      elsif error = flash[:google_sign_in][:error]
        logger.error "Google authentication error: #{error}"
        nil
      end
    end
end

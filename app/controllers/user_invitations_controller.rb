class UserInvitationsController < ApplicationController

  def create
    success = verify_recaptcha

    if success
      @user = User.invite!({name: params[:name], email: params[:email] }, current_user)
      flash[:notice] = "Invitation sent to #{@user.name}"
    else
      flash[:notice] = "Invalid recaptcha"
    end
    redirect_back(fallback_location: root_path) 
  end
end

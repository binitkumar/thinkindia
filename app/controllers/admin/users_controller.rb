class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def activation
    user = User.find(params[:id])
    unless user == current_user
      user.update_attribute(:is_active, !user.is_active)
    else
      flash[:error] = "Can't change own account status"
    end
    redirect_to admin_users_path
  end

  
  def update_is_admin 
    user = User.find(params[:id])
    unless user == current_user
      user.update_attribute(:is_admin, !user.is_admin)
    else
      flash[:error] = "Can't change own account status"
    end
    redirect_to admin_users_path
  end
end

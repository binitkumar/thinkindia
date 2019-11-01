class HomeController < ApplicationController
  def index
  end

  def user_details
    @user = User.friendly.find params[:id]
  end
end

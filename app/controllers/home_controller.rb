class HomeController < ApplicationController
  def index
  end

  def about
    @title = "About - Think India NITR club"
    @description = "Details of Think India NITR club" 
  end

  def user_details
    @user = User.friendly.find params[:id]
  end
end

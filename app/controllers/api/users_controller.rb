class Api::UsersController < ApplicationController

  def login
    user = User.find_by_email(params[:email])

    if user && user.valid_password?(params[:password])
      render json: { 
        status: 'success',
        authenticated: true,
        user: user
      }
    else
      render json: { 
        status: 'success',
        authenticated: false,
        message: 'Invalid email or password.'
      }
    end
  end

  def register
    user = User.new(user_params)
    
    if user.save
      render json: { 
        status: 'success',
        registered: true,
        user: user
      }
    else
      render json: { 
        status: 'error',
        authenticated: false,
        message: user.errors.full_messages
      }
    end
  end

  def update
    user = User.find(params[:id])
    
    if user.update(user_params)
      render json: { 
        status: 'success',
        message: "Account updated successfully",
        user: user
      }
    else
      render json: { 
        status: 'error',
        authenticated: false,
        message: user.errors.full_messages
      }
    end

  end

  def user_params
    params.permit(:name, :about_me, :email, :password, :password_confirmation)
  end
end

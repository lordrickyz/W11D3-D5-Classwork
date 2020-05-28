class Api::SessionsController < ApplicationController
  def create
    # Find user by credentials
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user.nil?
      render json: ['Nope. Wrong credentials!'], status: 401
    else
      login!(@user)
      render 'api/users/show';
    end
  end

  def destroy
    if current_user
    logout!
    render json: { message: 'Logout successful.' }
      return
    else
      render json: ['There is no user to log out!!'], status: 404
    end 

  end
end

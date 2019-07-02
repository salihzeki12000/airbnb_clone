class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(
      params[:user][:username], 
      params[:user][:password]
    )
    
    if @user
      render :show
    else
      render json: ['Invalid credentials']
    end
  end

  def destroy
    if current_user
      logout!
      render json: {}
    else
      render json: ["No currently logged in user"], status: 401
    end
  end
end
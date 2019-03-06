class UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users
  end

  def create 
    @user = User.new(user_params)

    if @user.save
      puts @user
    else
      puts "Try again!"
    end
  end

  def profile
    @user = User.find(params[:id])
    
    render json: @user
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end

module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :authorize_access_request!
      
      def update
        @user = current_user
        @user.update(user_params)

        render json: @users
      end
    
      def create 
        
      end
    
      def profile
        @user = current_user
        
        render json: @user
      end
    
      private

        def user_params
          params.require(:user).permit(:email, :password)
        end
    end    
  end
end
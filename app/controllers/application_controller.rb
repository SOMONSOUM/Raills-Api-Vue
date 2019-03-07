class ApplicationController < ActionController::Base
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  include Pundit
  protect_from_forgery

  private

    def current_user
      @current_user ||= User.find(payload['user_id'])
    end

    def not_authorized
      render json: { error: 'Not authorized' }, status: :unauthorized
    end
end

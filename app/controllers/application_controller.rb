# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    auth_header = request.headers['Authorization']
    return unless auth_header

    token = auth_header.split(' ').last
    return unless token

    begin
      payload, _header = JsonWebToken.decode_and_verify(token)
      @current_user = User.find_or_create_by(auth0_id: payload['sub'])
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end

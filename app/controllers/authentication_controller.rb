class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    outcome = AuthenticationUser.run(auth_params)

    if outcome.valid?
      render json: { auth_token: outcome.result }
    else
      render json: { error: outcome.errors }, status: :unauthorized
    end
  end

  private

  def auth_params
    params.require(:authentication).permit(:email, :password)
  end
end

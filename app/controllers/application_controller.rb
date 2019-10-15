class ApplicationController < ActionController::API
  before_action :authenticate_request

  attr_reader :current_user

  private

  def authenticate_request
    outcome = AuthorizeApiRequest.run(headers: headers)
    @current_user ||= outcome.result if outcome.valid?

    render json: { error: outcome.errors.messages }, status: 401 if outcome.invalid?
  end

  def headers
    { authorization: request.headers["Authorization"] }
  end
end

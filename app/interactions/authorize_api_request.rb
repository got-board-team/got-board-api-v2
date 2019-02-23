# Authorize request from the API
# Use:
# outcome = AuthorizeApiRequest.run(headers: { authorization: 'token' })
# outcome.valid?
# outcome.errors.messages
# outcome.result
require_dependency 'json_web_token'

class AuthorizeApiRequest < ActiveInteraction::Base
  hash :headers do
    string :authorization
  end

  def execute
    user
  end

  private

  def authorization
    headers[:authorization]
  end

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:base, :invalid_token) && false
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    authorization.split(' ').last
  end
end

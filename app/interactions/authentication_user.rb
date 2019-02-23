# Authenticate user with JWT, use this in application
# Use:
# outcome = AuthenticationUser.run(email, password)
# outcome.valid?
# outcome.errors.messages
# outcome.result
require_dependency 'json_web_token'

class AuthenticationUser < ActiveInteraction::Base
  string :email
  string :password

  def execute
    JsonWebToken.encode(user_id: user.id) if authenticate?
  end

  private

  def user
    @user ||= User.find_by_email(email)
  end

  def authenticate?
    return user if user && user.authenticate(password)

    errors.add :base, :invalid_credentials
    false
  end
end

# Generate token
# Use:
# token = JsonWebToken.encode(user_id: 42)
# JsonWebToken.decode(token)
class JsonWebToken
  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, secret_key_base, "HS256")
    end

    def decode(token)
      body = JWT.decode(token, secret_key_base, true, algorithm: "HS256")[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end

    private

    def secret_key_base
      Rails.application.secrets.secret_key_base
    end
  end
end

class User < ApplicationRecord
  has_secure_password

  with_options presence: true do |w|
    w.validates :name
    w.validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  end

  validates :password, confirmation: true
end

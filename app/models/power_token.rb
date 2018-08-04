class PowerToken < ApplicationRecord
  belongs_to :game
  belongs_to :house

  scope :available, -> { where(available: true) }
  scope :unavailable, -> { where(available: false) }
end

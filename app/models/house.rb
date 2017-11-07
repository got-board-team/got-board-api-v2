class House < ApplicationRecord
  # The order matters!
  # It's sorted according to which houses are played when there are <6 players
  VALID_HOUSES = %w[baratheon lannister stark greyjoy tyrell martell].freeze

  belongs_to :game

  has_many :tokens
  has_many :orders

  has_many :units
  has_many :footmen
  has_many :knights
  has_many :ships
  has_many :siege_engines

  has_many :power_tokens

  has_many :house_cards

  has_one :garrison_token

  # @todo Eventually will belong_to :user?

  validates_inclusion_of :name, in: VALID_HOUSES
  validates_uniqueness_of :name, scope: :game_id
end

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

  # @todo Eventually will belong_to :user?
  # @todo Eventually will have_many :house_cards/cards?

  validates_inclusion_of :name, in: VALID_HOUSES
  validates_uniqueness_of :name, scope: :game_id
end

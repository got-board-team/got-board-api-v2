class House < ApplicationRecord
  VALID_HOUSES = %w[baratheon lannister stark greyjoy tyrell martell].freeze

  belongs_to :game

  # @todo Eventually will belong_to :user?
  # @todo Eventually will have_many :house_cards/cards?

  validates_inclusion_of :victory_position, in: 0..7
  validates_inclusion_of :supply_position, in: 0..6
  validates_inclusion_of :blade_position, in: 1..6
  validates_inclusion_of :raven_position, in: 1..6
  validates_inclusion_of :throne_position, in: 1..6
  validates_inclusion_of :name, in: VALID_HOUSES

  validates_uniqueness_of :name, scope: :game_id
end

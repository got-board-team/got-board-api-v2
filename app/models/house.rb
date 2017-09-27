class House < ApplicationRecord
  VALID_HOUSES = %w[baratheon lannister stark greyjoy tyrell martell].freeze

  belongs_to :game

  has_many :influence_tokens

  # @todo Eventually will belong_to :user?
  # @todo Eventually will have_many :house_cards/cards?

  validates_inclusion_of :name, in: VALID_HOUSES
  validates_uniqueness_of :name, scope: :game_id
end

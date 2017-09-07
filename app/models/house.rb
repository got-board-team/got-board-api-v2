class House < ApplicationRecord
  VALID_HOUSES = %w[baratheon lannister stark greyjoy tyrell martell].freeze

  belongs_to :game

  # @todo Eventually will belong_to :user?
  # @todo Eventually will have_many :house_cards/cards?
  #
  # @todo Validate house name is included in VALID
  # @todo Constrain house name with game_id
  # @todo Validate presence of tracks positions and name
end

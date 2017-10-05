# @todo spec
module Games
  class CreatePowerTokens < ActiveInteraction::Base
    object :game

    AVAILABLE_TOKENS = 5
    UNAVAILABLE_TOKENS = 15

    def execute
      game.houses.map do |house|
        AVAILABLE_TOKENS.times { house.power_tokens.create(game: game, available: true) }
        UNAVAILABLE_TOKENS.times { house.power_tokens.create(game: game, available: false) }
      end
    end
  end
end

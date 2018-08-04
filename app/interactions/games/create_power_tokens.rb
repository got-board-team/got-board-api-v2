module Games
  class CreatePowerTokens < ActiveInteraction::Base
    object :game

    AVAILABLE_TOKENS = 5
    UNAVAILABLE_TOKENS = 15

    def execute
      tokens = []
      game.houses.map do |house|
        AVAILABLE_TOKENS.times { tokens << { game_id: game.id, house_id: house.id, available: true } }
        UNAVAILABLE_TOKENS.times { tokens << { game_id: game.id, house_id: house.id, available: false } }
      end
      PowerToken.import(tokens, validate: false)
    end
  end
end

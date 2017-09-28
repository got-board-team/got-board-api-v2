module Games
  class Create < ActiveInteraction::Base
    integer :number_of_houses, default: 6

    def execute
      Game.transaction do
        game = Game.create
        compose(CreateHouses, game: game, number_of_houses: number_of_houses)
        compose(CreateTokens, game: game)
        game.save
        game
      end
    end
  end
end

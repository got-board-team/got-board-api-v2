module Games
  class CreateWildlingCards < ActiveInteraction::Base
    object :game

    def execute
      wildling_cards.shuffle.map do |card|
        game.wildling_cards << { name: card, status: "face-down" }
      end
    end

    private

    def wildling_cards
      YAML.load_file(
        Rails.root.join("app/game_data/wildling_cards.yml")
      )
    end
  end
end

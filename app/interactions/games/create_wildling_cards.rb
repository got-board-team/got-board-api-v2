module Games
  class CreateWildlingCards < ActiveInteraction::Base
    object :game

    def execute
      cards = []
      wildling_cards.shuffle.map do |card|
        cards << { name: card, status: "face-down" }
      end
      game.wildling_cards = cards
    end

    private

    def wildling_cards
      YAML.load_file(
        Rails.root.join("app/game_data/wildling_cards.yml")
      )
    end
  end
end

module Games
  class CreateWildlingCards < ActiveInteraction::Base
    object :game

    def execute
      cards = []
      wildling_cards.shuffle.map.with_index do |card, index|
        cards << { name: card, status: "face-down", game_id: game.id, position: index + 1 }
      end
      WildlingCard.import(cards)
    end

    private

    def wildling_cards
      YAML.load_file(
        Rails.root.join("app/game_data/wildling_cards.yml")
      )
    end
  end
end

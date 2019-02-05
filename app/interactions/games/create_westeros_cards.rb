module Games
  class CreateWesterosCards < ActiveInteraction::Base
    object :game

    def execute
      create_decks
      create_cards
    end

    private

    def create_decks
      @decks_ids = {}
      3.times do |index|
        tier = index + 1
        id = game.westeros_decks.create(tier: tier).id
        @decks_ids[tier] = id
      end
    end

    def create_cards
      cards_attributes = []
      westeros_cards.map do |deck_tier, cards|
        cards.shuffle.map.with_index do |card, index|
          cards_attributes << {
            title: card,
            revealed: false,
            westeros_deck_id: @decks_ids[deck_tier],
            position: index + 1
          }
        end
      end

      WesterosCard.import(cards_attributes)
    end

    def westeros_cards
      YAML.load_file(
        Rails.root.join("app/game_data/westeros_cards.yml")
      )
    end
  end
end

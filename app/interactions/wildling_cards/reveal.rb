module WildlingCards
  class Reveal < ActiveInteraction::Base
    object :game

    def execute
      return revealed_card if any_revealed_card?

      first_card.tap { |card| card.update_attributes(status: "revealed") }
    end

    private

    def revealed_card
      @revealed_card ||= wildling_cards.revealed
    end

    def wildling_cards
      @wildling_cards ||= game.wildling_cards
    end

    def any_revealed_card?
      revealed_card.present?
    end

    def first_card
      wildling_cards.
        first
    end
  end
end

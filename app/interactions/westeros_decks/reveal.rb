module WesterosDecks
  class Reveal < ActiveInteraction::Base
    object :game

    def execute
      cards = []
      decks.each do |deck|
        hide_previous_card(deck)
        card = revealed_card(deck)
        card.update(revealed: true)

        cards << card
      end
      cards
    end

    private

    def decks
      game.westeros_decks
    end

    def hide_previous_card(deck)
      previous_card = deck.westeros_cards.first
      return unless previous_card.revealed?

      previous_card.update(revealed: false)
      previous_card.move_to_bottom
    end

    def revealed_card(deck)
      deck.westeros_cards.first
    end
  end
end

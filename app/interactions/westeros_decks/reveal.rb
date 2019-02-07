module WesterosDecks
  class Reveal < ActiveInteraction::Base
    object :deck, class: "WesterosDeck"

    def execute
      hide_previous_card
      revealed_card.update(revealed: true)

      revealed_card
    end

    private

    def hide_previous_card
      previous_card = deck.westeros_cards.first
      return unless previous_card.revealed?

      previous_card.update(revealed: false)
      previous_card.move_to_bottom
    end

    def revealed_card
      @revealed_card ||= deck.westeros_cards.first
    end
  end
end

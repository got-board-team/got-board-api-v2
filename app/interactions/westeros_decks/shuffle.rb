module WesterosDecks
  class Shuffle < ActiveInteraction::Base
    object :deck, class: "WesterosDeck"

    def execute
      available_positions = (1..deck.westeros_cards.size).to_a
      deck.westeros_cards.each do |card|
        new_position = random_position(available_positions)
        card.update(revealed: false) if card.revealed?
        card.insert_at(new_position)
      end
    end

    private

    def random_position(available_positions)
      available_positions.delete(available_positions.sample)
    end
  end
end

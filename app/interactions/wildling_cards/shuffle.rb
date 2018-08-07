module WildlingCards
  class Shuffle < ActiveInteraction::Base
    object :game

    def execute
      available_positions = (1..9).to_a
      wildling_cards.each do |card|
        new_position = random_position(available_positions)
        card.insert_at(new_position)
      end
    end

    private

    def wildling_cards
      game.wildling_cards.dup
    end

    def random_position(available_positions)
      available_positions.delete(available_positions.sample)
    end
  end
end

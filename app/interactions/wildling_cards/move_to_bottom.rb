module WildlingCards
  class MoveToBottom < ActiveInteraction::Base
    object :game

    def execute
      return if revealed_card.blank?
      revealed_card.update(status: "face-down")
      revealed_card.move_to_bottom
    end

    private

    def revealed_card
      @revealed_card ||= game.wildling_cards.revealed
    end
  end
end

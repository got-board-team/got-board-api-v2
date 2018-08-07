module WildlingCards
  class Hide < ActiveInteraction::Base
    object :game

    def execute
      return if revealed_card.blank?
      revealed_card.update(status: "face-down")
    end

    private

    def revealed_card
      @revealed_card ||= game.wildling_cards.revealed
    end
  end
end

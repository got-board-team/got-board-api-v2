module WildlingCards
  class Reveal < ActiveInteraction::Base
    object :game

    def execute
      # @todo Return revealed card if already exists
      first_card.tap { |card| card.update_attributes(status: "revealed") }
    end

    private

    def first_card
      game.
        wildling_cards.
        first
    end
  end
end

module WildlingCards
  class Peek < ActiveInteraction::Base
    array :wildling_cards

    def execute
      # @todo Change the card revelead status?
      wildling_cards.first
    end
  end
end

# @todo spec
class Game
  class WildlingCards
    attr_reader :cards

    def initialize(cards)
      @cards = cards
    end

    def peek
      card = ::WildlingCards::Peek.run!(wildling_cards: cards)
      WildlingCard.new(card)
    end
  end
end

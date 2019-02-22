require "rails_helper"

RSpec.describe WesterosDecks::Shuffle do
  describe ".run" do
    let(:game) { Games::Create.run!(number_of_houses: 3) }
    let(:deck) do
      game.westeros_decks.first
    end

    subject { described_class.run!(deck: deck) }

    it "saves cards with unique positions" do
      deck.westeros_cards.first.update(revealed: true)
      subject

      expect(deck.westeros_cards).to contain_exactly(
        have_attributes(position: 1, revealed: false),
        have_attributes(position: 2, revealed: false),
        have_attributes(position: 3, revealed: false),
        have_attributes(position: 4, revealed: false),
        have_attributes(position: 5, revealed: false)
      )
    end
  end
end

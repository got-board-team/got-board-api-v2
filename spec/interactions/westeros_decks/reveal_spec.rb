require "rails_helper"

RSpec.describe WesterosDecks::Reveal do
  describe ".run" do
    let(:game) { create(:game) }
    let(:deck) do
      Games::CreateWesterosCards.run!(game: game)
      game.westeros_decks.first
    end
    let!(:previous_card) do
      card = deck.westeros_cards.first
      card.update(revealed: true, title: "previouscard")
      card
    end

    subject { described_class.run!(deck: deck) }

    it "reveals first card from deck" do
      result = subject

      expect(result.title).not_to eq("previouscard")
      expect(result).to have_attributes(
        revealed: true,
        position: 1
      )
    end

    it "hides previously revealed card and places on bottom" do
      subject

      previous_card.reload
      expect(previous_card.revealed).to eq(false)
      expect(previous_card).to have_attributes(
        revealed: false,
        position: 5
      )
    end
  end
end

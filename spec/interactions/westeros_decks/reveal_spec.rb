require "rails_helper"

RSpec.describe WesterosDecks::Reveal do
  describe ".run" do
    let(:game) { create(:game) }
    let(:decks) do
      Games::CreateWesterosCards.run!(game: game)
      game.westeros_decks
    end
    let(:deck1) do
      Games::CreateWesterosCards.run!(game: game)
      decks.first
    end
    let(:deck2) do
      decks.second
    end
    let(:deck3) do
      Games::CreateWesterosCards.run!(game: game)
      decks.last
    end

    let!(:previous_card1) do
      card = deck1.westeros_cards.first
      card.update(revealed: true, title: "previouscard1")
      card
    end
    let!(:previous_card2) do
      card = deck2.westeros_cards.first
      card.update(revealed: true, title: "previouscard2")
      card
    end
    let!(:previous_card3) do
      card = deck3.westeros_cards.first
      card.update(revealed: true, title: "previouscard3")
      card
    end

    subject { described_class.run!(game: game) }

    it "reveals first card from all decks" do
      result = subject

      card1 = result.first
      card2 = result.second
      card3 = result.last

      expect(card1.title).not_to eq("previouscard1")
      expect(card1).to have_attributes(
        revealed: true,
        position: 1
      )

      expect(card2.title).not_to eq("previouscard2")
      expect(card2).to have_attributes(
        revealed: true,
        position: 1
      )

      expect(card3.title).not_to eq("previouscard3")
      expect(card3).to have_attributes(
        revealed: true,
        position: 1
      )
    end

    it "hides previously revealed card and places on bottom" do
      subject

      previous_card1.reload
      previous_card2.reload
      previous_card3.reload

      expect(previous_card1.revealed).to eq(false)
      expect(previous_card1).to have_attributes(
        revealed: false,
        position: 5
      )

      expect(previous_card2.revealed).to eq(false)
      expect(previous_card2).to have_attributes(
        revealed: false,
        position: 5
      )

      expect(previous_card3.revealed).to eq(false)
      expect(previous_card3).to have_attributes(
        revealed: false,
        position: 7
      )
    end
  end
end

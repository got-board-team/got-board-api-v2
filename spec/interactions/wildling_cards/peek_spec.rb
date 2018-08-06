require "rails_helper"

RSpec.describe WildlingCards::Peek do
  describe ".run" do
    it "returns the first card" do
      cards = %w[card1 card2 card3]
      outcome = described_class.run!(wildling_cards: cards)

      expect(outcome).to eq("card1")
    end
  end
end

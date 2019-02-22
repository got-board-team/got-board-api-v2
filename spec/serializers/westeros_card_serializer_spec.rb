require "rails_helper"

RSpec.describe WesterosCardSerializer, type: :serializer do
  let(:game) { create(:game) }
  let(:deck) { game.westeros_decks.create(tier: 1) }
  let(:westeros_card) { deck.westeros_cards.create(title: "sometitle") }
  let(:serialized_card) { serialize(westeros_card) }

  it "serializes its attributes" do
    expect(serialized_card["data"].keys).to match_array(%w[id attributes type])
  end

  context "attributes" do
    it "serializes its attributes" do
      expect(serialized_card["data"]["attributes"].keys).to match_array(
        %w[title deck-tier]
      )
    end
  end
end

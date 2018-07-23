require "rails_helper"

RSpec.describe GameSerializer, type: :serializer do
  let(:game) { create(:game) }
  let(:serialized_game) { serialize(game) }

  it "serializes its attributes" do
    expect(serialized_game["data"].keys).to match_array(%w[id attributes type relationships])
  end

  context "attributes" do
    it "serializes its attributes" do
      expect(serialized_game["data"]["attributes"].keys).to match_array(
        %w[round wildling-threat wildling-cards]
      )
    end
  end

  context "relationships" do
    it "serializes its relationships" do
      expect(serialized_game["data"]["relationships"].keys).to match_array(
        %w[territories houses units orders supply-tokens victory-tokens
           power-tokens house-cards neutral-force-tokens garrison-tokens
           influence-tokens]
      )
    end
  end
end

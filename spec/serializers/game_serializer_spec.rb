require "rails_helper"

RSpec.describe GameSerializer, type: :serializer do
  let(:game) { create(:game) }
  let(:serialized_game) { serialize(game) }

  it "should serialize its attributes" do
    expect(serialized_game["data"].keys).to match_array(%w[id attributes type relationships])
  end

  context "relationships" do
    it "should serialize its relationships" do
      expect(serialized_game["data"]["relationships"].keys).to match_array(
        %w[territories houses
           iron-throne-tokens kings-court-tokens fiefdom-tokens
           supply-tokens victory-tokens
           footmen knights ships siege-engines
           consolidation-orders defense-orders march-orders
           raid-orders support-orders
           power-tokens house-cards neutral-force-tokens
           garrison-tokens]
      )
    end
  end
end

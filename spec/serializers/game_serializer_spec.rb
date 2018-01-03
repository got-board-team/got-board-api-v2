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
        %w[territories houses units orders supply-tokens victory-tokens
           power-tokens house-cards neutral-force-tokens garrison-tokens
           influence-tokens]
      )
    end
  end
end

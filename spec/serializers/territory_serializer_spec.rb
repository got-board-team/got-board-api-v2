require "rails_helper"

RSpec.describe TerritorySerializer, type: :serializer do
  let(:game) { build_stubbed(:game, :with_territories) }

  let(:serialized_territory) { serialize(game.territories.first, serializer_class: TerritorySerializer) }

  it "should serialize its attributes" do
    expect(serialized_territory["data"].keys).to include("id")
    expect(serialized_territory["data"]["attributes"].keys).to match_array(
      %w[slug boundaries territory-type fortification-type
         supply-icons power-icons house-sigil names]
    )
  end
end

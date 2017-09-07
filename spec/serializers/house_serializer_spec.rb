require "rails_helper"

RSpec.describe HouseSerializer, type: :serializer do
  let(:house) { create(:house) }
  let(:serialized_house) { serialize(house) }

  it "should serialize its data" do
    expect(serialized_house["data"].keys).to match_array(
      %w[id type attributes relationships]
    )
  end

  it "should serialize its attributes" do
    expect(serialized_house["data"]["attributes"].keys).to match_array(
      %w[name victory-position supply-position blade-position throne-position raven-position]
    )
  end

  context "relationships" do
    it "should serialize its relationships" do
      expect(serialized_house["data"]["relationships"].keys).to match_array(%w[game])
    end
  end
end

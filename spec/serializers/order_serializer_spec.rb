require "rails_helper"

RSpec.describe OrderSerializer, type: :serializer do
  let(:house) { create(:house, name: "lannister") }
  subject do
    serialize(
      create(:order, :march, house: house)
    )
  end

  it "serializes attributes" do
    expect(subject["data"]["attributes"].keys).to match_array(
      %w[type x y territory revealed special strength house-name]
    )
  end

  it "serializes relationships" do
    expect(subject["data"]["relationships"].keys).to match_array(
      %w[game house]
    )
  end

  it "#house_name" do
    expect(subject["data"]["attributes"]["house-name"]).to eq("lannister")
  end
end

require "rails_helper"

RSpec.describe OrderSerializer, type: :serializer do
  subject do
    serialize(
      create(:order, :march)
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
end

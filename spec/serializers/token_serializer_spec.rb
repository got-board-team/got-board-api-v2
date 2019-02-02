require "rails_helper"

RSpec.describe TokenSerializer, type: :serializer do
  subject do
    serialize(
      create(:token)
    )
  end

  it "serializes attributes" do
    expect(subject["data"]["attributes"].keys).to match_array(
      %w[token-type x y position house-name]
    )
  end

  it "serializes relationships" do
    expect(subject["data"]["relationships"].keys).to match_array(
      %w[game house]
    )
  end
end

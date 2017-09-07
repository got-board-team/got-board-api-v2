require "rails_helper"

RSpec.shared_examples :track_serializer do
  let(:serialized_track) { serialize(track) }

  it "should serialize its attributes" do
    expect(serialized_track["data"].keys).to include("id")
    expect(serialized_track["data"]["attributes"].keys).to match_array(%w[positions])
  end
end

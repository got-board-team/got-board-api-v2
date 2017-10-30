require "rails_helper"

RSpec.describe NeutralForceTokenSerializer, type: :serializer do
  subject do
    serialize(
      create(:neutral_force_token)
    )
  end

  it "serializes attributes" do
    expect(subject["data"]["attributes"].keys).to match_array(
      %w[territory player-range strength]
    )
  end
end

require "rails_helper"

RSpec.describe SupplyTrackSerializer, type: :serializer do
  include_examples :track_serializer do
    let(:track) { build_stubbed(:supply_track) }
  end
end

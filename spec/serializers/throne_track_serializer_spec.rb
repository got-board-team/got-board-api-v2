require "rails_helper"

RSpec.describe ThroneTrackSerializer, type: :serializer do
  include_examples :influence_track_serializer do
    let(:track) { build_stubbed(:throne_track) }
  end
end

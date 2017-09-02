require "rails_helper"

RSpec.describe BladeTrackSerializer, type: :serializer do
  include_examples :influence_track_serializer do
    let(:track) { build_stubbed(:blade_track) }
  end
end

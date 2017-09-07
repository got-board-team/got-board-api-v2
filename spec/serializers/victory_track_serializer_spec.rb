require "rails_helper"

RSpec.describe VictoryTrackSerializer, type: :serializer do
  include_examples :track_serializer do
    let(:track) { build_stubbed(:victory_track) }
  end
end

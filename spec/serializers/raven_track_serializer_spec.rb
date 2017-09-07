require "rails_helper"

RSpec.describe RavenTrackSerializer, type: :serializer do
  include_examples :track_serializer do
    let(:track) { build_stubbed(:raven_track) }
  end
end

require "rails_helper"

RSpec.describe ThroneTrack do
  let(:throne_track) { build_stubbed(:throne_track) }

  include_examples :influence_trackable do
    let(:track) { throne_track }
  end
end

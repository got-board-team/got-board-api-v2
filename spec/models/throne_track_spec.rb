require "rails_helper"

RSpec.describe ThroneTrack do
  include_examples :trackable
  include_examples :influence_trackable do
    let(:track) { build_stubbed(:throne_track) }
  end
end

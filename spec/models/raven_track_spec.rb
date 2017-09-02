require "rails_helper"

RSpec.describe RavenTrack do
  let(:raven_track) { build_stubbed(:raven_track) }

  include_examples :influence_trackable do
    let(:track) { raven_track }
  end
end

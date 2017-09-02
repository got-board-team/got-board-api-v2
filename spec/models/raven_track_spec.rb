require "rails_helper"

RSpec.describe RavenTrack do
  include_examples :influence_trackable do
    let(:track) { build_stubbed(:raven_track) }
  end
end

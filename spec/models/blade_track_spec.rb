require "rails_helper"

RSpec.describe BladeTrack do
  let(:blade_track) { build_stubbed(:blade_track) }

  include_examples :influence_trackable do
    let(:track) { blade_track }
  end
end

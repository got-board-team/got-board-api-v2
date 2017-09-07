require "rails_helper"

RSpec.describe BladeTrack do
  include_examples :influence_trackable do
    let(:track) { build_stubbed(:blade_track) }
  end
end

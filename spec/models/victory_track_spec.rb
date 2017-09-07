require "rails_helper"

RSpec.describe VictoryTrack do
  include_examples :resource_trackable do
    let(:track) { build_stubbed(:victory_track) }
  end
end

require "rails_helper"

RSpec.describe SupplyTrack do
  include_examples :resource_trackable do
    let(:track) { build_stubbed(:supply_track) }
  end
end

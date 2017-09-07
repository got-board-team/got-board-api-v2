RSpec.shared_examples :resource_trackable do
  include_examples :trackable

  context "when no house is repeated in a track" do
    it "is valid" do
      expect(track).to be_valid
    end
  end

  context "when a house is repeatead in a track" do
    before :each do
      track.positions = {
        "0" => [],
        "1" => %w[stark stark lannister baratheon tyrell],
        "2" => %w[greyjoy],
        "3" => [], "4" => [], "5" => [], "6" => []
      }
    end

    it "is not valid" do
      track.valid?
      expect(track.errors[:positions]).to include("house cannot be repeated in track")
    end
  end

  context "when an invalid house is in the track" do
    before :each do
      track.positions["3"] << "arryn"
    end

    it "is not valid" do
      track.valid?
      expect(track.errors[:positions]).to include("arryn house is not a valid house")
    end
  end
end

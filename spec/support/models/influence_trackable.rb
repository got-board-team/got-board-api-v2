RSpec.shared_examples :influence_trackable do
  include_examples :trackable

  it { is_expected.to have_many(:influence_tokens) }

  context "when no house is repeated in a track" do
    it "is valid" do
      expect(track).to be_valid
    end
  end

  context "when a house is repeated in a track" do
    before :each do
      track.positions = %w[baratheon baratheon stark lannister greyjoy martell]
    end

    it "is not valid" do
      track.valid?
      expect(track.errors[:positions]).to include("house cannot be repeated in track")
    end
  end

  context "when an invalid house is in the track" do
    before :each do
      track.positions << "arryn"
    end

    it "is not valid" do
      track.valid?
      expect(track.errors[:positions]).to include("arryn house is not a valid house")
    end
  end
end

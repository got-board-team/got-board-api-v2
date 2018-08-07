require "rails_helper"

RSpec.describe WildlingCards::Reveal do
  describe ".run" do
    let(:game) { create(:game) }

    subject { described_class.run!(game: game) }

    before :each do
      WildlingCard.create(game: game, status: "face-down", name: "second", position: 2)
      WildlingCard.create(game: game, status: "face-down", name: "first", position: 1)
    end

    it "returns a WildlingCard" do
      expect(subject).to be_a(WildlingCard)
    end

    it "returns the first card" do
      expect(subject).to have_attributes(name: "first")
    end

    it "saves the card as revealed" do
      expect(subject.reload).to have_attributes(status: "revealed")
    end

    context "when there is already a revealed card" do
      before :each do
        WildlingCard.create(game: game, status: "revealed", name: "third", position: 3)
      end

      it "returns a WildlingCard" do
        expect(subject).to be_a(WildlingCard)
      end

      it "returns the revealed card" do
        expect(subject).to have_attributes(name: "third")
      end
    end
  end
end

require "rails_helper"

RSpec.describe Games::CreateNeutralForceTokens do
  describe ".run" do
    let(:game) { Game.create }
    subject { described_class.run!(game: game) }

    context "when number of players is 5" do
      before :each do
        Games::CreateHouses.run!(game: game, number_of_houses: 5)
      end

      it "creates 9 neutral force tokens" do
        expect(subject.size).to eq(9)
      end
    end

    context "when number of players is 3" do
      before :each do
        Games::CreateHouses.run!(game: game, number_of_houses: 3)
      end

      it "creates 14 neutral force tokens" do
        expect(subject.size).to eq(14)
      end
    end
  end
end

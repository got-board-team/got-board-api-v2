require "rails_helper"

RSpec.describe Games::CreateNeutralForceTokens do
  describe ".run" do
    let(:game) { Game.create }
    let(:players_number) { 6 }

    subject { described_class.run!(game: game) }

    before :each do
      Games::CreateHouses.run!(game: game, number_of_houses: players_number)
    end

    it "sets neutral_forces player_range, strength, territory" do
      expect(subject).to all(
        have_attributes(
          territory: be_present,
          player_range: be_present,
          strength: be_present
        )
      )
    end

    context "with neutral_forces with a single number of players" do
      let(:players_number) { 3 }

      it "sets player_range with the number" do
        neutral_force = subject.find_by_territory(:highgarden)
        expect(neutral_force.player_range).to eq "3"
      end
    end

    context "with neutral_forces with a range of number players" do
      it "formats player range" do
        neutral_force = subject.find_by_territory(:eyrie)
        expect(neutral_force.player_range).to eq "4-6"
      end
    end

    context "when number of players is 5" do
      let(:players_number) { 5 }

      it "creates 9 neutral force tokens" do
        ap subject
        expect(subject.size).to eq(9)
      end
    end

    context "when number of players is 3" do
      let(:players_number) { 3 }

      it "creates 14 neutral force tokens" do
        expect(subject.size).to eq(14)
      end
    end
  end
end

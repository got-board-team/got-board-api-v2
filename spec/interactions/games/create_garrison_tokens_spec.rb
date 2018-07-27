require "rails_helper"

RSpec.describe Games::CreateGarrisonTokens do
  describe ".run" do
    let(:game) { Game.create }
    let(:players_number) { 3 }

    subject { described_class.run!(game: game) }

    before :each do
      Games::CreateHouses.run!(game: game, number_of_houses: players_number)
    end

    it "creates garrisons only for existing houses" do
      subject
      expect(game.garrison_tokens).to contain_exactly(
        have_attributes(name: "dragonstone"),
        have_attributes(name: "winterfell"),
        have_attributes(name: "lannisport")
      )
    end
  end
end

require "rails_helper"

RSpec.describe Games::CreateGarrisonTokens do
  describe ".run" do
    let(:game) { Game.create }
    let(:players_number) { 3 }

    subject { described_class.run!(game: game) }

    before :each do
      Games::CreateHouses.run!(game: game, number_of_houses: players_number)
    end

    it "creates 3 garrisons" do
      subject
      expect(game.garrison_tokens.count).to eq 3
    end
  end
end

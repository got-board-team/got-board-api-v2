require "rails_helper"

RSpec.describe Games::CreatePowerTokens do
  let(:game) { Game.create }

  subject { described_class.run!(game: game) }

  before :each do
    Games::CreateHouses.run!(game: game, number_of_houses: 3)
  end

  it "creates 15 unavailable tokens and 5 available tokens for each house" do
    subject
    game.houses.map do |house|
      expect(house.power_tokens.available.count).to eq(5)
      expect(house.power_tokens.unavailable.count).to eq(15)
    end
  end
end

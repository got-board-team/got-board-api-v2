require "rails_helper"

RSpec.describe Games::CreateUnits do
  describe ".run" do
    let(:game) { Game.create }
    subject { Games::CreateUnits.run!(game: game) }

    before :each do
      Games::CreateHouses.run!(game: game)
    end

    it "creates all units a house can have" do
      subject

      game.houses.each do |house|
        expect(house.footmen.size).to eq(10)
        expect(house.knights.size).to eq(5)
        expect(house.ships.size).to eq(6)
        expect(house.siege_engines.size).to eq(2)
      end
    end
  end
end

require "rails_helper"

RSpec.describe Games::CreateUnits do
  describe ".run" do
    let(:game) { Game.create }
    subject { Games::CreateUnits.run!(game: game) }

    before :each do
      Games::CreateHouses.run!(game: game)
    end

    it "returns units" do
      expect(subject.first).to be_a(Unit)
    end

    it "persists units" do
      expect(subject.first).to be_persisted
    end

    it "creates all units a house can have" do
      subject
      house = game.houses.first
      expect(house.footmen.size).to eq(10)
      expect(house.knights.size).to eq(5)
      expect(house.ships.size).to eq(6)
      expect(house.siege_engines.size).to eq(2)
    end
  end
end

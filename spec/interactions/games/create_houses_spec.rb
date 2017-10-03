require "rails_helper"

RSpec.describe Games::CreateHouses do
  describe ".run" do
    let(:game) { Game.create }
    subject { described_class.run!(game: game, number_of_houses: 5) }

    it "returns collection of houses" do
      expect(subject.first).to be_a(House)
    end

    it "returns a collection of 5 houses" do
      expect(subject.size).to eq(5)
    end

    it "creates houses" do
      expect(subject.first).to be_persisted
    end

    it "returns houses associated with given game" do
      expect(subject.first.game_id).to eq game.id
    end
  end
end

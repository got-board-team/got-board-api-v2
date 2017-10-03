require "rails_helper"

RSpec.describe Games::CreateTokens do
  describe ".run" do
    let(:game) { Game.create }
    subject { described_class.run!(game: game) }

    before :each do
      Games::CreateHouses.run!(game: game, number_of_houses: 4)
    end

    it "returns a collection of tokens" do
      expect(subject.first).to be_a(Token)
    end

    it "saves the tokens" do
      expect(subject.first).to be_persisted
    end

    it "adjust token position according to number of houses" do
      subject
      expect(game.iron_throne_tokens.last.position).to eq(4)
    end

    it "creates 4 tokens for each track" do
      subject
      expect(game.iron_throne_tokens.size).to eq(4)
      expect(game.fiefdom_tokens.size).to eq(4)
      expect(game.kings_court_tokens.size).to eq(4)
      expect(game.supply_tokens.size).to eq(4)
      expect(game.victory_tokens.size).to eq(4)
    end

    it "loads setup YAML" do
      expect(YAML).to receive(:load_file).and_call_original
      subject
    end
  end
end

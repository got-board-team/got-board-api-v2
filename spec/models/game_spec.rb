require "rails_helper"

RSpec.describe Game, type: :model do
  it { is_expected.to validate_numericality_of(:round).is_greater_than(0).is_less_than(11) }
  it { is_expected.to validate_numericality_of(:wildling_threat).is_greater_than(0).is_less_than(13).even }
  it { is_expected.to have_many(:houses) }
  it { is_expected.to have_many(:tokens) }
  it { is_expected.to have_many(:iron_throne_tokens) }
  it { is_expected.to have_many(:fiefdom_tokens) }
  it { is_expected.to have_many(:kings_court_tokens) }
  it { is_expected.to have_many(:supply_tokens) }
  it { is_expected.to have_many(:victory_tokens) }
  it { is_expected.to have_many(:orders) }
  it { is_expected.to have_many(:units) }
  it { is_expected.to have_many(:footmen) }
  it { is_expected.to have_many(:knights) }
  it { is_expected.to have_many(:ships) }
  it { is_expected.to have_many(:siege_engines) }

  describe "#territories" do
    let(:game) { build_stubbed(:game) }

    it "fetches a list of territories" do
      allow(Games::FetchTerritories).to receive(:run).and_call_original
      game.territories
      expect(Games::FetchTerritories).to have_received(:run).with(game: game)
    end
  end
end

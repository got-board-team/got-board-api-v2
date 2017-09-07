require "rails_helper"

RSpec.describe Game, type: :model do
  it { is_expected.to validate_numericality_of(:round).is_greater_than(0).is_less_than(11) }
  it { is_expected.to validate_numericality_of(:wildling_threat).is_greater_than(0).is_less_than(13).even }
  it { is_expected.to have_one(:blade_track) }
  it { is_expected.to have_one(:raven_track) }
  it { is_expected.to have_one(:throne_track) }
  it { is_expected.to have_one(:supply_track) }
  it { is_expected.to have_one(:victory_track) }
  it { is_expected.to have_many(:houses) }

  describe "#territories" do
    let(:game) { build_stubbed(:game) }

    it "fetches a list of territories" do
      allow(Games::FetchTerritories).to receive(:run).and_call_original
      game.territories
      expect(Games::FetchTerritories).to have_received(:run).with(game: game)
    end
  end
end

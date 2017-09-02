require "rails_helper"

RSpec.describe Game, type: :model do
  it { is_expected.to validate_numericality_of(:round).is_greater_than(0).is_less_than(11) }
  it { is_expected.to validate_numericality_of(:wildling_threat).is_greater_than(0).is_less_than(13).even }

  describe "#territories" do
    let(:game) { build_stubbed(:game) }

    it "fetches a list of territories" do
      expect(game.territories.first).to be_a(Game::Territory)
    end

    it "fetches territory from map areas file" do
      expect(game.territories.first).to have_attributes(
        id: 1,
        slug: "bay_of_ice",
        type: "Sea",
        fortification_type: nil,
        supply_icons: 0,
        power_icons: 0,
        house_sigil: nil,
        names: { en: "Bay of Ice", pt: "Baía de Gelo" }
      )
    end
  end
end

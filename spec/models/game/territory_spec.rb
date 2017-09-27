require "rails_helper"

RSpec.describe Game::Territory do
  describe "attributes" do
    let(:game) { build_stubbed(:game) }
    let(:territory) { game.territories.first }

    it "has all its attributes" do
      expect(territory).to have_attributes(
        id: 1,
        game_id: game.id,
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

require "rails_helper"

RSpec.describe Game, type: :model do
  describe "#territories" do
    let(:game) { create(:game) }

    it "fetches a list of territories" do
      expect(game.territories.first).to be_a(Game::Territory)
    end

    it "fetches territory from map areas file" do
      expect(game.territories.first).to have_attributes(
        id: 1,
        slug: "bay_of_ice",
        type: "Sea",
        fortification_type: nil,
        barrels_count: 0,
        crowns_count: 0,
        house_sigil: nil,
        names: { en: "Bay of Ice", pt: "Baía de Gelo" }
      )
    end
  end
end

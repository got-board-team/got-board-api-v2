require "rails_helper"

RSpec.describe Games::FetchTerritories do
  describe ".run" do
    let(:game) { build_stubbed(:game) }
    subject { described_class.run!(game: game) }

    it "fetches a list of territories" do
      expect(subject.first).to be_a(Game::Territory)
    end

    it "builds territory from territory info file" do
      expect(game.territories.first).to have_attributes(
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

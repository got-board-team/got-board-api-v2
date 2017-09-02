require "rails_helper"

RSpec.describe Game, type: :model do
  it { is_expected.to validate_numericality_of(:round).is_greater_than(0).is_less_than(11) }
  it { is_expected.to validate_numericality_of(:wildling_threat).is_greater_than(0).is_less_than(13).even }

  context "validations" do
    context "when a house is repeated in throne track" do
      let(:game) { build_stubbed(:game) }

      before :each do
        game.throne_track = %w[baratheon baratheon stark lannister greyjoy martell]
      end

      it "is not valid" do
        game.valid?
        expect(game.errors[:throne_track]).to match_array(["house cannot be repeated in throne track"])
      end
    end

    context "when a house is repeated in blade track" do
      let(:game) { build_stubbed(:game) }

      before :each do
        game.blade_track = %w[baratheon baratheon stark lannister greyjoy martell]
      end

      it "is not valid" do
        game.valid?
        expect(game.errors[:blade_track]).to match_array(["house cannot be repeated in blade track"])
      end
    end

    context "when a house is repeated in raven track" do
      let(:game) { build_stubbed(:game) }

      before :each do
        game.raven_track = %w[baratheon baratheon stark lannister greyjoy martell]
      end

      it "is not valid" do
        game.valid?
        expect(game.errors[:raven_track]).to match_array(["house cannot be repeated in raven track"])
      end
    end
  end

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

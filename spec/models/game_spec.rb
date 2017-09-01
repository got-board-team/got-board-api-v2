require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "#territories" do
    let(:game) { create(:game) }

    it "fetches a list of territories" do
      expect(game.territories.first).to be_a(Game::Territory)
    end

    it "fetches territory from map areas file" do
      expect(game.territories.first).to have_attributes(
        id: 1,
        slug: "bay_of_ice"
      )
    end
  end
end

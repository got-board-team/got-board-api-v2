require "rails_helper"

RSpec.describe Game, type: :model do
  it { is_expected.to validate_numericality_of(:round).is_greater_than(0).is_less_than(11) }
  it { is_expected.to validate_numericality_of(:wildling_threat).is_greater_than_or_equal_to(0).is_less_than(13).even }
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
  it { is_expected.to have_many(:power_tokens) }
  it { is_expected.to have_many(:house_cards) }
  it { is_expected.to have_many(:wildling_cards) }
  it { is_expected.to have_many(:neutral_force_tokens) }
  it { is_expected.to have_many(:garrison_tokens) }

  describe "#territories" do
    let(:game) { build(:game, :with_territories) }

    it "fetches a list of territories" do
      expect(game.territories).to exist
    end
  end

  context "influence_tokens" do
    let(:game) { create(:game) }
    let(:stark) { create(:house, game: game, name: "stark") }
    let(:baratheon) { create(:house, game: game, name: "baratheon") }

    before :each do
      game.iron_throne_tokens.create(id: 1, position: 1, house_id: stark.id)
      game.iron_throne_tokens.create(id: 2, position: 2, house_id: baratheon.id)
      game.fiefdom_tokens.create(id: 3, position: 1, house_id: stark.id)
      game.fiefdom_tokens.create(id: 4, position: 2, house_id: baratheon.id)
      game.kings_court_tokens.create(id: 5, position: 1, house_id: stark.id)
      game.kings_court_tokens.create(id: 6, position: 2, house_id: baratheon.id)
      game.supply_tokens.create(id: 7, position: 1, house_id: stark.id)
      game.supply_tokens.create(id: 8, position: 2, house_id: baratheon.id)
    end

    describe "#influence_tokens" do
      it "returns all influence tokens" do
        expect(game.influence_tokens).to contain_exactly(
          have_attributes(type: "IronThroneToken", position: 1, house_id: stark.id),
          have_attributes(type: "IronThroneToken", position: 2, house_id: baratheon.id),
          have_attributes(type: "FiefdomToken", position: 1, house_id: stark.id),
          have_attributes(type: "FiefdomToken", position: 2, house_id: baratheon.id),
          have_attributes(type: "KingsCourtToken", position: 1, house_id: stark.id),
          have_attributes(type: "KingsCourtToken", position: 2, house_id: baratheon.id)
        )
      end
    end

    describe "#influence_token_ids" do
      it "returns all influence tokens ids" do
        expect(game.influence_token_ids).to contain_exactly(
          1, 2, 3, 4, 5, 6
        )
      end
    end
  end
end

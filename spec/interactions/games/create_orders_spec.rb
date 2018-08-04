require "rails_helper"

RSpec.describe Games::CreateOrders do
  let(:game) { Game.new }

  subject { described_class.run!(game: game) }

  before :each do
    Games::CreateHouses.run!(game: game, number_of_players: 3)
  end

  it "creates orders for each houses" do
    subject
    game.houses.each do |house|
      expect(house.orders).to contain_exactly(
        have_attributes(type: "MarchOrder",         game_id: game.id, revealed: false, strength: -1, special: false, x: 0, y: 0),
        have_attributes(type: "MarchOrder",         game_id: game.id, revealed: false, strength:  0, special: false, x: 0, y: 0),
        have_attributes(type: "MarchOrder",         game_id: game.id, revealed: false, strength:  1, special: true,  x: 0, y: 0),
        have_attributes(type: "SupportOrder",       game_id: game.id, revealed: false, strength:  0, special: false, x: 0, y: 0),
        have_attributes(type: "SupportOrder",       game_id: game.id, revealed: false, strength:  0, special: false, x: 0, y: 0),
        have_attributes(type: "SupportOrder",       game_id: game.id, revealed: false, strength:  1, special: true,  x: 0, y: 0),
        have_attributes(type: "RaidOrder",          game_id: game.id, revealed: false, strength:  0, special: false, x: 0, y: 0),
        have_attributes(type: "RaidOrder",          game_id: game.id, revealed: false, strength:  0, special: false, x: 0, y: 0),
        have_attributes(type: "RaidOrder",          game_id: game.id, revealed: false, strength:  0, special: true,  x: 0, y: 0),
        have_attributes(type: "DefenseOrder",       game_id: game.id, revealed: false, strength:  1, special: false, x: 0, y: 0),
        have_attributes(type: "DefenseOrder",       game_id: game.id, revealed: false, strength:  1, special: false, x: 0, y: 0),
        have_attributes(type: "DefenseOrder",       game_id: game.id, revealed: false, strength:  2, special: true,  x: 0, y: 0),
        have_attributes(type: "ConsolidationOrder", game_id: game.id, revealed: false, strength:  0, special: false, x: 0, y: 0),
        have_attributes(type: "ConsolidationOrder", game_id: game.id, revealed: false, strength:  0, special: false, x: 0, y: 0),
        have_attributes(type: "ConsolidationOrder", game_id: game.id, revealed: false, strength:  0, special: true,  x: 0, y: 0)
      )
    end
  end
end

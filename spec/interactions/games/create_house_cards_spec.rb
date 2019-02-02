require "rails_helper"

RSpec.describe Games::CreateHouseCards do
  let(:game) { Game.create }

  subject { described_class.run!(game: game) }

  before :each do
    Games::CreateHouses.run!(game: game, number_of_houses: 6)
  end

  it "creates cards for all houses" do
    subject
    expect(game.house_cards).to contain_exactly(
      have_attributes(name: "brienne"),
      have_attributes(name: "davos"),
      have_attributes(name: "melisandre"),
      have_attributes(name: "patchface"),
      have_attributes(name: "renly"),
      have_attributes(name: "salladhor"),
      have_attributes(name: "stannis"),
      have_attributes(name: "aeron"),
      have_attributes(name: "asha"),
      have_attributes(name: "balon"),
      have_attributes(name: "dagmar"),
      have_attributes(name: "euron"),
      have_attributes(name: "theon"),
      have_attributes(name: "victarion"),
      have_attributes(name: "cersei"),
      have_attributes(name: "gregor"),
      have_attributes(name: "hound"),
      have_attributes(name: "jaime"),
      have_attributes(name: "kevan"),
      have_attributes(name: "tyrion"),
      have_attributes(name: "tywin"),
      have_attributes(name: "catelyn_stark"),
      have_attributes(name: "eddard_stark"),
      have_attributes(name: "greatjon_umber"),
      have_attributes(name: "robb_stark"),
      have_attributes(name: "roose_bolton"),
      have_attributes(name: "ser_rodrik_cassel"),
      have_attributes(name: "the_blackfish"),
      have_attributes(name: "alester"),
      have_attributes(name: "garlan"),
      have_attributes(name: "loras"),
      have_attributes(name: "mace"),
      have_attributes(name: "margaery"),
      have_attributes(name: "queen"),
      have_attributes(name: "randyll"),
      have_attributes(name: "areo"),
      have_attributes(name: "arianne"),
      have_attributes(name: "darkstar"),
      have_attributes(name: "doran"),
      have_attributes(name: "nymeria"),
      have_attributes(name: "obara"),
      have_attributes(name: "redviper")
    )
  end
end

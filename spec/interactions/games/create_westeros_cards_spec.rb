require "rails_helper"

RSpec.describe Games::CreateWesterosCards do
  describe ".run" do
    let(:game) { create(:game) }

    subject { described_class.run!(game: game) }

    it "creates all cards" do
      subject
      expect(game.westeros_decks).to contain_exactly(
        have_attributes(
          tier: 1,
          westeros_cards: contain_exactly(
            have_attributes(title: "lastdayssummer", revealed: false, position: Integer),
            have_attributes(title: "mustering", revealed: false, position: Integer),
            have_attributes(title: "supply", revealed: false, position: Integer),
            have_attributes(title: "thoneofblades", revealed: false, position: Integer),
            have_attributes(title: "winteriscoming", revealed: false, position: Integer)
          )
        ),
        have_attributes(
          tier: 2,
          westeros_cards: contain_exactly(
            have_attributes(title: "clashofkings", revealed: false, position: Integer),
            have_attributes(title: "darkwingsdarkwords", revealed: false, position: Integer),
            have_attributes(title: "gameofthrones", revealed: false, position: Integer),
            have_attributes(title: "lastdayssummerii", revealed: false, position: Integer),
            have_attributes(title: "wintercoming", revealed: false, position: Integer)
          )
        ),
        have_attributes(
          tier: 3,
          westeros_cards: contain_exactly(
            have_attributes(title: "feastforcrows", revealed: false, position: Integer),
            have_attributes(title: "puttothesword", revealed: false, position: Integer),
            have_attributes(title: "rainsofautumn", revealed: false, position: Integer),
            have_attributes(title: "seaofstorms", revealed: false, position: Integer),
            have_attributes(title: "stormofswords", revealed: false, position: Integer),
            have_attributes(title: "weboflies", revealed: false, position: Integer),
            have_attributes(title: "wildingsattack", revealed: false, position: Integer)
          )
        )
      )
    end
  end
end

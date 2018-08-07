require "rails_helper"

RSpec.describe Games::CreateWildlingCards do
  describe ".run" do
    let(:game) { Game.create }

    subject { described_class.run!(game: game) }

    it "builds collection of face-down wildling cards" do
      subject
      expect(game.wildling_cards).to contain_exactly(
        have_attributes(position: Integer),
        have_attributes(position: Integer),
        have_attributes(position: Integer),
        have_attributes(position: Integer),
        have_attributes(position: Integer),
        have_attributes(position: Integer),
        have_attributes(position: Integer),
        have_attributes(position: Integer),
        have_attributes(position: Integer)
      )
    end

    it "builds collection of wildling cards with unique position" do
      subject

      expect(game.wildling_cards).to contain_exactly(
        have_attributes(position: 1),
        have_attributes(position: 2),
        have_attributes(position: 3),
        have_attributes(position: 4),
        have_attributes(position: 5),
        have_attributes(position: 6),
        have_attributes(position: 7),
        have_attributes(position: 8),
        have_attributes(position: 9)
      )
    end
  end
end

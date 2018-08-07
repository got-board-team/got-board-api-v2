require "rails_helper"

RSpec.describe WildlingCards::Shuffle do
  describe ".run" do
    let(:game) { Games::Create.run!(number_of_houses: 3) }

    subject { described_class.run!(game: game) }

    it "saves cards with unique positions" do
      subject

      expect(game.wildling_cards.reload).to contain_exactly(
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

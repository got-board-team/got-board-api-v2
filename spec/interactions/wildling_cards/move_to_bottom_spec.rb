require "rails_helper"

RSpec.describe WildlingCards::MoveToBottom do
  let(:game) { Games::Create.run!(number_of_houses: 3) }

  subject { described_class.run!(game: game) }

  before :each do
    game.wildling_cards.first.update(status: "revealed")
  end

  it "moves card to bottom of deck" do
    revealed_card = game.wildling_cards.first

    subject
    expect(game.wildling_cards.reload).to contain_exactly(
      have_attributes(status: "face-down", position: 1),
      have_attributes(status: "face-down", position: 2),
      have_attributes(status: "face-down", position: 3),
      have_attributes(status: "face-down", position: 4),
      have_attributes(status: "face-down", position: 5),
      have_attributes(status: "face-down", position: 6),
      have_attributes(status: "face-down", position: 7),
      have_attributes(status: "face-down", position: 8),
      have_attributes(id: revealed_card.id, status: "face-down", position: 9)
    )
  end

  context "when there is no revealed card" do
    it "does not raise" do
      expect { subject }.not_to raise_error
    end
  end
end

require "rails_helper"

RSpec.describe WildlingCards::Hide do
  describe ".run" do
    let(:game) { Games::Create.run!(number_of_houses: 3) }

    subject { described_class.run!(game: game) }

    context "when there is a revealed card" do
      before :each do
        game.wildling_cards.first.update_attributes(status: "revealed")
      end

      it "hides revealed card" do
        subject

        expect(game.wildling_cards.reload).to contain_exactly(
          have_attributes(status: "face-down"),
          have_attributes(status: "face-down"),
          have_attributes(status: "face-down"),
          have_attributes(status: "face-down"),
          have_attributes(status: "face-down"),
          have_attributes(status: "face-down"),
          have_attributes(status: "face-down"),
          have_attributes(status: "face-down"),
          have_attributes(status: "face-down")
        )
      end
    end

    context "when there is no revealed card" do
      it "does not raise" do
        expect { subject }.not_to raise_error
      end
    end
  end
end

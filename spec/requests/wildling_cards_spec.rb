require "rails_helper"

RSpec.describe "Wildling Cards" do
  shared_examples :respond_with_card do
    it "is successful" do
      subject

      expect(response).to have_http_status(:ok)
    end

    it "calls the Reveal interaction" do
      expect(WildlingCards::Reveal).to receive(:run!).with(
        game: have_attributes(id: game_id)
      ).and_call_original
      subject
    end

    it "responds with a revealed card" do
      subject
      parsed_response = JSON.parse(response.body)["data"]

      expect(parsed_response["type"]).to eq("wildling-card")
      expect(parsed_response["attributes"]).to match(
        "name" => String,
        "status" => "revealed"
      )
    end
  end

  let(:game_id) { Games::Create.run!(number_of_houses: 3).id }

  before :each do
    allow(Pusher).to receive(:trigger)
  end

  context "peeking a wildling card" do
    subject { patch "/games/#{game_id}/wildling_cards/peek" }

    it "sends Pusher message" do
      expect(Pusher).to receive(:trigger).with(
        "game", "wildling-peek", game_id: game_id, 42 => 42
      )
      subject
    end

    it_behaves_like :respond_with_card
  end

  context "drawing a wildling card" do
    subject { patch "/games/#{game_id}/wildling_cards/draw" }

    it "sends Pusher message" do
      expect(Pusher).to receive(:trigger).with(
        "game", "wildling-draw", game_id: game_id, name: String
      )
      subject
    end

    it_behaves_like :respond_with_card
  end

  context "shuffling a wildling card" do
    subject { patch "/games/#{game_id}/wildling_cards/shuffle" }

    it "sends Pusher message" do
      expect(Pusher).to receive(:trigger).with(
        "game", "wildling-shuffle", game_id: game_id, 42 => 42
      )
      subject
    end

    it "shuffles deck" do
      expect(WildlingCards::Shuffle).to receive(:run!).with(
        game: have_attributes(id: game_id)
      )
      subject
    end

    it "returns no content" do
      subject

      expect(response).to have_http_status(:no_content)
    end
  end

  context "hiding a wildling card" do
    subject { patch "/games/#{game_id}/wildling_cards/hide" }

    before :each do
      WildlingCard.where(game_id: game_id, position: 1).first.update(status: "revealed")
    end

    it "sends Pusher message" do
      expect(Pusher).to receive(:trigger).with(
        "game", "wildling-hide", game_id: game_id, 42 => 42
      )
      subject
    end

    it "hides card" do
      expect(WildlingCards::Hide).to receive(:run!).with(
        game: have_attributes(id: game_id)
      )
      subject
    end

    it "returns no content" do
      subject

      expect(response).to have_http_status(:no_content)
    end
  end

  context "moving a wildling card to bottom" do
    subject { patch "/games/#{game_id}/wildling_cards/move_to_bottom" }

    before :each do
      WildlingCard.where(game_id: game_id, position: 1).first.update(status: "revealed")
    end

    it "sends Pusher message" do
      expect(Pusher).to receive(:trigger).with(
        "game", "wildling-move-to-bottom", game_id: game_id, 42 => 42
      )
      subject
    end

    it "moves card to bottom of deck" do
      expect(WildlingCards::MoveToBottom).to receive(:run!).with(
        game: have_attributes(id: game_id)
      )
      subject
    end

    it "returns no content" do
      subject

      expect(response).to have_http_status(:no_content)
    end
  end
end

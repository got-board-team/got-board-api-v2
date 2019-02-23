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

  let!(:user) { create(:user, id: 42) }
  let(:game_id) { Games::Create.run!(number_of_houses: 3).id }
  let(:headers) do
    {
      "Authorization" => 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0MiwiZXhwIjoxNDg4MTY0NDAwfQ.DCXVVuhxEWz7L8lqwIaJvifVEMRqygDnQY2abVBJ4mc'
    }
  end

  before do
    Timecop.freeze(Time.local(2017, 2, 26))
    allow(Rails.application.secrets).to receive(:secret_key_base).and_return("FOO")
    allow(Pusher).to receive(:trigger)
  end

  after do
    Timecop.return
  end


  context "peeking a wildling card" do
    subject { patch "/games/#{game_id}/wildling_cards/peek", headers: headers }

    it "sends Pusher message" do
      expect(Pusher).to receive(:trigger).with(
        "game", "wildling-peek", game_id: game_id, 42 => 42
      )
      subject
    end

    it_behaves_like :respond_with_card
  end

  context "drawing a wildling card" do
    subject { patch "/games/#{game_id}/wildling_cards/draw", headers: headers }

    it "sends Pusher message" do
      expect(Pusher).to receive(:trigger).with(
        "game", "wildling-draw", game_id: game_id, name: String
      )
      subject
    end

    it_behaves_like :respond_with_card
  end

  context "shuffling a wildling card" do
    subject { patch "/games/#{game_id}/wildling_cards/shuffle", headers: headers }

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
    subject { patch "/games/#{game_id}/wildling_cards/hide", headers: headers }

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
    subject { patch "/games/#{game_id}/wildling_cards/move_to_bottom", headers: headers }

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

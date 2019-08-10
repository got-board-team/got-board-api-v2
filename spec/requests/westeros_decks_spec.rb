require "rails_helper"

RSpec.describe "Westeros Decks" do
  let(:game) { Games::Create.run!(number_of_houses: 3) }
  let(:card1) { game.westeros_decks.first.westeros_cards.first }
  let(:card2) { game.westeros_decks.second.westeros_cards.first }
  let(:card3) { game.westeros_decks.last.westeros_cards.first }

  before :each do
    allow(Pusher).to receive(:trigger)
  end

  context "revealing decks" do
    subject { patch "/games/#{game.id}/westeros_decks/reveal" }

    it "sends Pusher messages" do
      expect(Pusher).to receive(:trigger).with(
        "game", "westeros-reveal", game_id: game.id, name: card1.title
      )
      expect(Pusher).to receive(:trigger).with(
        "game", "westeros-reveal", game_id: game.id, name: card2.title
      )
      expect(Pusher).to receive(:trigger).with(
        "game", "westeros-reveal", game_id: game.id, name: card3.title
      )
      subject
    end

    it "returns revealed cards" do
      subject
      parsed_response = JSON.parse(response.body)["data"]

      expect(parsed_response).to contain_exactly(
        include("id" => String, "type" => "westeros-card", "attributes" => { "deck-tier" => 1, "title" => card1.title }),
        include("id" => String, "type" => "westeros-card", "attributes" => { "deck-tier" => 2, "title" => card2.title }),
        include("id" => String, "type" => "westeros-card", "attributes" => { "deck-tier" => 3, "title" => card3.title })
      )
    end
  end

  context "shuffling westeros decks" do
    subject { patch "/games/#{game.id}/westeros_decks/shuffle", params: { tier: 1 } }

    it "sends Pusher message" do
      expect(Pusher).to receive(:trigger).with(
        "game", "westeros-shuffle", game_id: game.id, 42 => 42
      )
      subject
    end

    it "shuffles deck" do
      expect(WesterosDecks::Shuffle).to receive(:run!).with(
        deck: game.westeros_decks.find_by_tier(1)
      )
      subject
    end

    it "returns no content" do
      subject

      expect(response).to have_http_status(:no_content)
    end
  end
end

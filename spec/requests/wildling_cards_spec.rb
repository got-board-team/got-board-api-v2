require "rails_helper"

RSpec.describe "Wildling Cards" do
  context "peeking a wildling card" do
    before :each do
      game_id = Games::Create.run!(number_of_houses: 3).id
      patch "/games/#{game_id}/wildling_cards/peek"
    end

    it "is successful" do
      expect(response).to have_http_status(:ok)
    end

    it "responds with a peeked card" do
      parsed_response = JSON.parse(response.body)["data"]

      expect(parsed_response["type"]).to eq("wildling-cards")
      expect(parsed_response["attributes"]).to match(
        "name" => String,
        "status" => "revealed"
      )
    end
  end
end

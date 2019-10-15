require "rails_helper"

RSpec.describe "Games" do
  let!(:user) { create(:user, id: 42) }
  let(:headers) do
    {
      "Authorization" => 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0MiwiZXhwIjoxNDg4MTY0NDAwfQ.DCXVVuhxEWz7L8lqwIaJvifVEMRqygDnQY2abVBJ4mc'
    }
  end

  before do
    Timecop.freeze(Time.local(2017, 2, 26))
    allow(Rails.application.secrets).to receive(:secret_key_base).and_return("FOO")
  end

  context "finding a game" do
    let(:game_id) { Games::Create.run!(number_of_houses: 3).id }

    it "is successful" do
      get "/games/#{game_id}", headers: headers
      expect(response).to have_http_status(:ok)
    end

    it "does not return included relationships" do
      get "/games/#{game_id}", headers: headers
      parsed_response = JSON.parse(response.body)

      expect(parsed_response["included"]).to be_nil
    end

    it "responds with the game" do
      get "/games/#{game_id}", headers: headers
      parsed_response = JSON.parse(response.body)["data"]

      expect(parsed_response["id"]).to eq(game_id.to_s)
      expect(parsed_response["type"]).to eq("game")
    end

    context "with included relationships" do
      it "responds with included relationships" do
        get "/games/#{game_id}?include=houses,garrison_tokens,influence_tokens", headers: headers
        parsed_response = JSON.parse(response.body)

        expect(parsed_response["included"]).to contain_exactly(
          include("type" => "house"),
          include("type" => "house"),
          include("type" => "house"),
          include("type" => "garrison-token"),
          include("type" => "garrison-token"),
          include("type" => "garrison-token"),
          include("type" => "influence-token"),
          include("type" => "influence-token"),
          include("type" => "influence-token"),
          include("type" => "influence-token"),
          include("type" => "influence-token"),
          include("type" => "influence-token"),
          include("type" => "influence-token"),
          include("type" => "influence-token"),
          include("type" => "influence-token")
        )
      end
    end

    context "with included relationships using dashes instead of underscores" do
      it "responds with included relationships" do
        get "/games/#{game_id}?include=houses,garrison-tokens,influence-tokens"
        parsed_response = JSON.parse(response.body)

        expect(parsed_response["included"]).to contain_exactly(
          include("type" => "house"),
          include("type" => "house"),
          include("type" => "house"),
          include("type" => "garrison-token"),
          include("type" => "garrison-token"),
          include("type" => "garrison-token"),
          include("type" => "influence-token"),
          include("type" => "influence-token"),
          include("type" => "influence-token"),
          include("type" => "influence-token"),
          include("type" => "influence-token"),
          include("type" => "influence-token"),
          include("type" => "influence-token"),
          include("type" => "influence-token"),
          include("type" => "influence-token")
        )
      end
    end
  end
end

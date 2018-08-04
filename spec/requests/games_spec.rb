require "rails_helper"

RSpec.describe "Games" do
  context "listing Games" do
    before :each do
      create_list(:game, 2)
    end

    it "is successful" do
      get "/games"

      expect(response).to have_http_status(:ok)
    end

    it "returns all games" do
      get "/games"

      parsed_response = JSON.parse(response.body)["data"]
      expect(parsed_response.size).to eq(2)
    end
  end
end

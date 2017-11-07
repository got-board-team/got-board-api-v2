require 'rails_helper'

RSpec.describe TokensController, type: :controller do

  describe "GET #neutral_force_tokens" do
    it "returns http success" do
      get :neutral_force_tokens
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #units" do
    it "returns http success" do
      get :units
      expect(response).to have_http_status(:success)
    end
  end

end

require "rails_helper"

RSpec.describe PowerToken do
  it { is_expected.to belong_to(:game) }
  it { is_expected.to belong_to(:house) }

  describe ".available" do
    let!(:token1) { create(:power_token, available: true) }
    let!(:token2) { create(:power_token, available: false) }
    let!(:token3) { create(:power_token, available: true) }

    it "returns only available tokens" do
      expect(described_class.available).to contain_exactly(
        token1, token3
      )
    end
  end

  describe ".unavailable" do
    let!(:token1) { create(:power_token, available: false) }
    let!(:token2) { create(:power_token, available: true) }
    let!(:token3) { create(:power_token, available: false) }

    it "returns only unavailable tokens" do
      expect(described_class.unavailable).to contain_exactly(
        token1, token3
      )
    end
  end
end

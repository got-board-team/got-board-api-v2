require "rails_helper"

RSpec.describe House do
  it { is_expected.to belong_to(:game) }

  describe ".VALID_HOUSES" do
    it "lists all valid houses" do
      valid_houses = %w[baratheon lannister stark greyjoy tyrell martell]
      expect(House::VALID_HOUSES).to match_array(valid_houses)
    end
  end
end

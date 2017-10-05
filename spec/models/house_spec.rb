require "rails_helper"

RSpec.describe House do
  it { is_expected.to belong_to(:game) }
  it { is_expected.to have_many(:tokens) }
  it { is_expected.to have_many(:orders) }
  it { is_expected.to have_many(:units) }
  it { is_expected.to have_many(:footmen) }
  it { is_expected.to have_many(:knights) }
  it { is_expected.to have_many(:ships) }
  it { is_expected.to have_many(:siege_engines) }
  it { is_expected.to have_many(:power_tokens) }
  it { is_expected.to have_many(:house_cards) }
  it { is_expected.to validate_inclusion_of(:name).in_array(House::VALID_HOUSES) }

  describe "validations" do
    it "validates_uniqueness_of" do
      create(:house) # necessary due to db-level constraints and the way shoulda_matchers works
      is_expected.to validate_uniqueness_of(:name).scoped_to(:game_id)
    end
  end

  describe ".VALID_HOUSES" do
    it "lists all valid houses" do
      valid_houses = %w[baratheon lannister stark greyjoy tyrell martell]
      expect(House::VALID_HOUSES).to match_array(valid_houses)
    end
  end
end

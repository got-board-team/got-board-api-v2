require "rails_helper"

RSpec.describe House do
  it { is_expected.to belong_to(:game) }
  it { is_expected.to validate_inclusion_of(:name).in_array(House::VALID_HOUSES) }
  it { is_expected.to validate_inclusion_of(:victory_position).in_range(0..7) }
  it { is_expected.to validate_inclusion_of(:supply_position).in_range(0..6) }
  it { is_expected.to validate_inclusion_of(:blade_position).in_range(1..6) }
  it { is_expected.to validate_inclusion_of(:raven_position).in_range(1..6) }
  it { is_expected.to validate_inclusion_of(:throne_position).in_range(1..6) }

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

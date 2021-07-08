require "rails_helper"

RSpec.describe WesterosDeck do
  it { is_expected.to belong_to(:game) }
  it { is_expected.to have_many(:westeros_cards) }
  it { is_expected.to validate_numericality_of(:tier).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(3) }
end

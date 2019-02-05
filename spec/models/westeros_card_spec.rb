require "rails_helper"

RSpec.describe WesterosCard do
  it { is_expected.to belong_to(:westeros_deck) }
  it { is_expected.to validate_presence_of(:title) }
end

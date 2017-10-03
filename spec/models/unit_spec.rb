require "rails_helper"

RSpec.describe Unit do
  it { is_expected.to belong_to(:game) }
  it { is_expected.to belong_to(:house) }
end

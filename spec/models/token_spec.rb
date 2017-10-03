require "rails_helper"

RSpec.describe Token do
  it { is_expected.to belong_to(:game) }
  it { is_expected.to belong_to(:house) }
end

require "rails_helper"

RSpec.describe Territories::Import do
  subject { described_class.run! }

  it "imports 58 territories" do
    subject

    expect(Territory.count).to eq(58)
  end

  context "when database already has territories" do
    before(:each) { Territory.create }

    it "raises error" do
      expect { subject }.to raise_error(
        ArgumentError,
        "Database already has Territories. Destroy them before proceeding."
      )
    end
  end
end

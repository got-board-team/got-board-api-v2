require "rails_helper"

RSpec.describe Games::Create do
  describe ".run" do
    let(:outcome) { double(:outcome, invalid?: false, result: []) }
    subject { Games::Create.run! }

    it "creates game" do
      expect(subject).to be_persisted
    end

    it "calls CreateHouses" do
      expect(Games::CreateHouses).to receive(:run).and_return(outcome)
      subject
    end

    it "calls CreateTokens" do
      expect(Games::CreateTokens).to receive(:run).and_return(outcome)
      subject
    end

    it "calls CreateUnits" do
      expect(Games::CreateUnits).to receive(:run).and_return(outcome)
      subject
    end
  end
end

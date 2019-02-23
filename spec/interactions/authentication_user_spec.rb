require 'rails_helper'

RSpec.describe AuthenticationUser, type: :interactions do
  describe 'run' do
    let(:user) { build_stubbed(:user) }

    it 'authenticate' do
      expect(User).to receive(:find_by_email).with(user.email).and_return(user)
      expect(JsonWebToken).to receive(:encode).with(user_id: user.id)
      described_class.run!(email: user.email, password: user.password)
    end

    it "doesn't find credentials" do
      outcome = described_class.run(email: user.email, password: '12')
      outcome.result
      expect(outcome.errors.details).to eq(base: [{ error: :invalid_credentials }])
    end
  end
end

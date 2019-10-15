require 'rails_helper'
require_dependency "json_web_token"

RSpec.describe JsonWebToken, type: :lib do
  let(:token_str) do
    'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0MiwiZXhwIjoxNDg4MTY0NDAwfQ.DCXVVuhxEWz7L8lqwIaJvifVEMRqygDnQY2abVBJ4mc'
  end

  before do
    Timecop.freeze(Time.local(2017, 2, 26))
    allow(Rails.application.secrets).to receive(:secret_key_base).and_return("FOO")
  end

  describe '.encode' do
    subject { described_class.encode(user_id: 42) }

    it 'generates token' do
      expect(subject).to eq(token_str)
    end

    it 'generates other token' do
      Timecop.freeze(Time.local(2017, 2, 27)) do
        expect(subject).not_to eq(token_str)
      end
    end
  end

  describe '.decode' do
    it 'generates token' do
      token = described_class.decode(token_str)
      expect(token).to eq('user_id' => 42, 'exp' => 1_488_164_400)
    end

    it 'is nil when exception' do
      token = described_class.decode(nil)
      expect(token).to be_nil
    end
  end
end

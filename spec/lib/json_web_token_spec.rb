require 'rails_helper'
require_dependency "json_web_token"

RSpec.describe JsonWebToken, type: :lib do
  let(:token_str) do
    'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0MiwiZXhwIjoxNDg4MTY0NDAwfQ.DCXVVuhxEWz7L8lqwIaJvifVEMRqygDnQY2abVBJ4mc'
  end

  before do
    allow(Rails.application.secrets).to receive(:secret_key_base).and_return("FOO")
  end

  describe '.encode' do
    it 'generates token' do
      Timecop.freeze(Time.local(2017, 2, 26)) do
        token = described_class.encode(user_id: 42)
        expect(token).to eq(token_str)
      end
    end

    it 'generates other token' do
      Timecop.freeze(Time.local(2017, 2, 27)) do
        token = described_class.encode(user_id: 42)
        expect(token).not_to eq(token_str)
      end
    end
  end

  describe '.decode' do
    it 'generates token' do
      Timecop.freeze(Time.local(2017, 2, 26)) do
        token = described_class.decode(token_str)
        expect(token).to eq('user_id' => 42, 'exp' => 1_488_164_400)
      end
    end

    it 'is nil when exception' do
      Timecop.freeze(Time.local(2017, 2, 26)) do
        token = described_class.decode(nil)
        expect(token).to be_nil
      end
    end
  end
end

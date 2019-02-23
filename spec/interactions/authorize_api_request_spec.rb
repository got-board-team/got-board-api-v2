require 'rails_helper'

RSpec.describe AuthorizeApiRequest, type: :interactions do
  describe 'run' do
    let!(:user) { create(:user, id: 42) }
    let(:headers) do
      {
        authorization: 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0MiwiZXhwIjoxNDg4MTY0NDAwfQ.ZMHeNY9QTe0B3VLkmiIGxjXayJGWSRnYc1tTqcqThLI'
      }
    end

    it 'find user' do
      Timecop.freeze(Time.local(2017, 2, 26)) do
        auth = described_class.run(headers: headers)
        expect(auth.result).to eq(user)
      end
    end

    it 'is a missing token' do
      Timecop.freeze(Time.local(2017, 2, 26)) do
        auth = described_class.run(headers: { 'auth': 'foo' })
        expect(auth.invalid?).to be_truthy
        expect(auth.errors.messages).to eq(headers: ['Authorization in header did not come'])
      end
    end

    it 'is an invalid token' do
      auth = described_class.run(headers: { authorization: 'foo' })
      expect(auth.invalid?).to be_truthy
      expect(auth.errors.messages).to eq(base: ['Invalid token'])
    end
  end
end

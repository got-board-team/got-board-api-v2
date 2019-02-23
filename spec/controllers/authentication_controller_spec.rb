require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  describe 'POST authenticate' do
    let!(:user) { create(:user, id: 42) }

    context 'when is valid' do
      let(:params) do
        {
          authentication: {
            email: user.email,
            password: user.password
          }
        }
      end

      before do
        Timecop.freeze(Time.local(2017, 2, 26))
        allow(Rails.application.secrets).to receive(:secret_key_base).and_return("FOO")
        post :authenticate, params: params, format: :json
      end

      after do
        Timecop.return
      end

      it 'returns HTTP 200 ok' do
        expect(response.status).to eq(200)
      end

      it 'returns json with result' do
        expect(JSON.parse(response.body)).to match('auth_token' => 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0MiwiZXhwIjoxNDg4MTY0NDAwfQ.DCXVVuhxEWz7L8lqwIaJvifVEMRqygDnQY2abVBJ4mc')
      end
    end

    context 'when is invalid' do
      let(:invalid_params) do
        {
          authentication: {
            email: 'email@email.com',
            password: '1234'
          }
        }
      end

      before do
        post :authenticate, params: invalid_params, format: :json
      end

      it 'returns HTTP 401 unauthorized' do
        expect(response.status).to eq(401)
      end

      it 'returns errors' do
        expect(JSON.parse(response.body)).to match('error' => { 'base' => ['Invalid credentials'] })
      end
    end
  end
end

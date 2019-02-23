require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let!(:user) { create(:user, id: 42) }
  let(:headers) do
    {
      'Authorization': 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0MiwiZXhwIjoxNDg4MTY0NDAwfQ.DCXVVuhxEWz7L8lqwIaJvifVEMRqygDnQY2abVBJ4mc'
    }
  end

  before :each do
    allow(Rails.application.secrets).to receive(:secret_key_base).and_return("FOO")
  end

  describe '#authenticate_request' do
    controller do
      def index
        render json: { success: 'ok' }
      end
    end

    it 'returns HTTP 401 unauthorized' do
      get :index, format: :json
      expect(response.status).to eq(401)
    end

    it 'returns errors' do
      get :index, format: :json
      expect(JSON.parse(response.body)).to eq('error' => { 'headers' => ['Authorization in header did not come'] })
    end
  end
end

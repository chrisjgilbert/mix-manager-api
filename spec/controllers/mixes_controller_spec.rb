require 'rails_helper'

RSpec.describe Api::V1::MixesController, type: :request do
  describe 'GET /api/v1/mixes' do
    let!(:mixes) { create_list(:mix, 10) }
    before { get '/api/v1/mixes' }

    it 'retuns all articles' do
      json = JSON.parse(response.body)
      expect(json.size).to eq(10)
    end

    it 'returns a 200' do
      expect(response).to have_http_status(200)
    end
  end
end

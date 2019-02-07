require 'rails_helper'

RSpec.describe Api::V1::MixesController, type: :request do

  let!(:mixes) { create_list(:mix, 10) }
  let(:mix_id) { mixes.first.id }

  describe 'GET /api/v1/mixes' do
    before { get '/api/v1/mixes' }
    it 'retuns all articles' do
      json = JSON.parse(response.body)
      expect(json.size).to eq(10)
    end

    it 'returns a 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /mixes/:id' do
    before { get "/api/v1/mixes/#{mix_id}" }
    it 'returns the given the mix' do
      json = JSON.parse(response.body)
      expect(json['id']).to eq(mix_id)
    end

    it 'returns a 200' do
      expect(response).to have_http_status(200)
    end
  end
end

require 'rails_helper'

RSpec.describe Api::V1::MixesController, type: :request do

  let!(:mixes) { create_list(:mix, 10) }
  let(:mix_id) { mixes.first.id }
  let(:payload) { { mix: { title: 'my mix', url: 'www.blah.com' } } }

  describe 'GET /api/v1/mixes' do
    before { get '/api/v1/mixes' }
    it 'retuns all articles' do
      expect(json.size).to eq(10)
    end

    it 'returns a 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /mixes/:id' do
    before { get "/api/v1/mixes/#{mix_id}" }
    it 'returns the given the mix' do
      expect(json['id']).to eq(mix_id)
    end

    it 'returns a 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /articles' do
    it 'creates a mix' do
      expect { post '/api/v1/mixes/', params: payload }.to change { Mix.count }.by(1)
    end

    before { post '/api/v1/mixes', params: payload }
    it 'reurns the created mix' do
      expect(json['title']).to eq('my mix')
      expect(json['url']).to eq('www.blah.com')
    end

    it 'returns a 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'PUT /api/v1/mixes/:id' do
    before { put "/api/v1/mixes/#{mix_id}", params: payload }
    it 'updates the record' do
      expect(response.body).to be_empty
    end

    it 'returns a 204' do
      expect(response).to have_http_status(204)
    end
  end

  describe 'DELETE /api/v1/mixes/mix_id' do
    it 'deletes the mix from the db' do
      expect { delete "/api/v1/mixes/#{mix_id}" }.to change { Mix.count }.by(-1)
    end
  end
end

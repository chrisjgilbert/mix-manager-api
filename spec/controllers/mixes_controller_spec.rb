require 'rails_helper'

RSpec.describe Api::V1::MixesController, type: :request do
  describe 'GET /api/v1/mixes' do
    let!(:mixes) { create_list(:mix, 10) }
    it 'retuns all articles' do
      get '/api/v1/mixes'
      json = JSON.parse(response.body)
      expect(json.size).to eq(10)
    end
  end
end

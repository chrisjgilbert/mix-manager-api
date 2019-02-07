require 'rails_helper'

RSpec.describe Api::V1::MixesController, type: :controller do

  describe 'GET /index' do
    let!(:mixes) { create_list(:mix, 10) }

    it 'retuns all articles' do
      get :index
      expect(json.size).to eq(10)
    end
  end

end

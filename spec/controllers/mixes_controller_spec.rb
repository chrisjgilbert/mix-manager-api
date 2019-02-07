require 'rails_helper'

RSpec.describe Api::V1::MixesController, type: :controller do

  describe 'GET /index' do
    it 'retuns all articles' do
      get :index
    end
  end

end

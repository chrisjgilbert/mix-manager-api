require 'rails_helper'

RSpec.describe Mix, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
  it { should have_many(:taggings).dependent(:destroy) }
  it { should have_many(:tags).through(:taggings) }

  describe '#tagged_with' do
    let!(:mix) { FactoryBot.create(:mix) }

    it 'returns the tags on a mix' do
      expect(Mix.tagged_with(mix.tags.size)).to eq(1)
    end
  end
end

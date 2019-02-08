require 'rails_helper'

RSpec.describe Mix, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
  it { should have_many(:taggings).dependent(:destroy) }
  it { should have_many(:tags).through(:taggings) }

  describe '.tag_list' do
    let(:mix) { described_class.new(title: 'my mix', url: 'blah.com', tag_list: 'house, techno') }

    it 'saves tags' do
      allow(Tag).to receive(:name).and_return(Tag)
      expect(mix.tags.size).to eq(2)
    end

    it 'returns the tag list' do
      allow(Tag).to receive(:name).and_return(Tag)
      expect(mix.tag_list).to eq('house, techno')
    end
  end
end

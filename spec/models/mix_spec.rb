require 'rails_helper'

RSpec.describe Mix, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
  it { should have_many(:taggings).dependent(:destroy) }
  it { should have_many(:tags).through(:taggings) }

  describe '.tag_list' do
    let!(:mix) { FactoryBot.create(:mix) }

    it 'saves tags' do
      subject.tag_list=('techno, house')
      expect(subject.tags.size).to eq(2)
    end
  end
end

require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:taggings).dependent(:destroy) }
  it { should have_many(:mixes).through(:taggings) }
end

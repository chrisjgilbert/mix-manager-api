require 'rails_helper'

RSpec.describe Mix, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
  it { should have_many(:taggings) }
  it { should have_many(:tags).through(:taggings) }
end

class Mix < ApplicationRecord
  validates_presence_of :title, :url
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def tag_list=(names)
    self.tags = names.split(', ').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def tag_list
    tags.map(&:name).join(', ')
  end
end

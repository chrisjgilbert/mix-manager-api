class Mix < ApplicationRecord
  validates_presence_of :title, :url
  has_many :taggings
  has_many :tags, through: :taggings
end

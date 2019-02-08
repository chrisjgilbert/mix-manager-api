class Tag < ApplicationRecord
  validates_presence_of :name
  has_many :taggings
  has_many :mixes, through: :taggings
end

class Field < ApplicationRecord
  validates :name, uniqueness: true
  has_many :tags
end

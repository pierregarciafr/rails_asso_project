class Asso < ApplicationRecord
  belongs_to :user
  has_one :detail, as: :detailable
  has_many :events, as: :eventable
  accepts_nested_attributes_for :detail, :events
  validates :name, length: { maximum: 50 }
end

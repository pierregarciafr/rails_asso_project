class Event < ApplicationRecord
  belongs_to :eventable, polymorphic: true
  has_one :detail, as: :detailable
  accepts_nested_attributes_for :detail
end

class Detail < ApplicationRecord
  belongs_to :detailable, polymorphic: true
end

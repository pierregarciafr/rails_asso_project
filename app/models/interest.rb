class Interest < ApplicationRecord
  belongs_to :user
  enum couple_status: InterestCoupleStatus::COUPLE_STATUSES
end

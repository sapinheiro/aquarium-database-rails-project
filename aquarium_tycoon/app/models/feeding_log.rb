class FeedingLog < ApplicationRecord
  belongs_to :employee
  belongs_to :tank
end

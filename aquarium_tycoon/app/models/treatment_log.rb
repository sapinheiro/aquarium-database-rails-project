class TreatmentLog < ApplicationRecord
  belongs_to :animal
  belongs_to :employee
end

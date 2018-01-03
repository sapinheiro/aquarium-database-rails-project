class Employee < ApplicationRecord
  has_many :treatment_logs
  has_many :feeding_logs

  def full_name
    "#{last_name}, #{first_name}"
  end
end

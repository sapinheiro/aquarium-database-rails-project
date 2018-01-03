class Animal < ApplicationRecord
  belongs_to :tank
  has_many :treatment_logs

  def id_name
    "#{animal_id} #{name}"
  end
end

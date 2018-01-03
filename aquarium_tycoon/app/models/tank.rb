class Tank < ApplicationRecord
  belongs_to :habitat
  has_many :animals
  has_many :feeding_logs
end

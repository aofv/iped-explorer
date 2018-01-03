class Veteran < ApplicationRecord
  belongs_to :school

  validates :school_id,
    uniqueness: { scope: :year }
end

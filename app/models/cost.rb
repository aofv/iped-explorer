class Cost < ApplicationRecord
  belongs_to :school

  validates :school_id,
    uniqueness: { scope: :year }
  validates :school_id,
    presence: true
  validates :year,
    presence: true
end

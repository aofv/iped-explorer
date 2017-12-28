class SportExpenses < ApplicationRecord
  MOST_RECENT_REPORTING_YEAR = 2016

  belongs_to :school

  validates :school_id,
    uniqueness: { scope: :year }

  scope :most_recent, -> { where(year: MOST_RECENT_REPORTING_YEAR) }
end

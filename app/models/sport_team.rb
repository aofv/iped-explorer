class SportTeam < ApplicationRecord
  MOST_RECENT_REPORTING_YEAR = 2016

  belongs_to :school

  scope :most_recent, -> { where(year: MOST_RECENT_REPORTING_YEAR) }
end

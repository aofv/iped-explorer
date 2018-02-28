class DegreeProgram < ApplicationRecord
  validates :cip_code,
    uniqueness: true
end

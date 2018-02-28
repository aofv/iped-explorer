class DegreeProgram < ApplicationRecord
  has_many :degree_program_mappings
  has_many :schools,
    through: :degree_program_mappings

  validates :cip_code,
    uniqueness: true
end

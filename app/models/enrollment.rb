class Enrollment < ApplicationRecord
  belongs_to :school

  validates :school_id,
    uniqueness: { scope: [:year, :level_of_student] }

  def level_of_student_name
    case self.level_of_student
    when 1; 'undergraduate'
    when 3; 'graduate'
    when 999; 'all'
    end
  end

end

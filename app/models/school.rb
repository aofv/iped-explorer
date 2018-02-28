class School < ApplicationRecord

  has_many :sport_teams
  has_many :sport_expenses
  has_many :general_finances
  has_many :admissions
  has_many :veterans
  has_many :enrollments
  has_many :costs
  has_one :housing_allowance
  has_one :school_snapshot
  has_many :degree_program_mappings
  has_many :degree_programs,
    through: :degree_program_mappings

  scope :grants_degrees, -> { where(grants_degrees: true) }

  validates :uid,
    uniqueness: true

  def self.random
    School.order('RANDOM()').first
  end

  def zip_first_five
    self.zip.length > 5 ? self.zip[0..4] : self.zip
  end

  def region_name
    case region
    when 1; 'New England'
    when 2; 'Mid East'
    when 3; 'Great Lakes'
    when 4; 'Plains'
    when 5; 'Southeast'
    when 6; 'Southwest'
    when 7; 'Rocky Mountains'
    when 8; 'Far West'
    when 9; 'Outlying Areas'
    when -3; 'N/A'
    else 'Unknown'
    end
  end

  def control_name
    case control
    when 1; 'Public'
    when 2; 'Private Non-Profit'
    when 3; 'Private For-Profit'
    end
  end

  def enrollment_profile_name
    case enrollment_profile
    when 1;	"Exclusively undergraduate two-year"
    when 2;	"Exclusively undergraduate four-year"
    when 3;	"Very high undergraduate"
    when 4;	"High undergraduate"
    when 5;	"Majority undergraduate"
    when 6;	"Majority graduate"
    when 7;	"Exclusively graduate"
    when -2; "N/A"
    end
  end

  def sector_name
    case sector
    when 1; "Public, 4-year or above"
    when 2; "Private not-for-profit, 4-year or above"
    when 3; "Private for-profit, 4-year or above"
    when 4; "Public, 2-year"
    when 5; "Private not-for-profit, 2-year"
    when 6; "Private for-profit, 2-year"
    when 7; "Public, less-than 2-year"
    when 8; "Private not-for-profit, less-than 2-year"
    when 9; "Private for-profit, less-than 2-year"
    when 99;	"Sector unknown (not active)"
    end
  end

  def undergraduate_profile_name
    case undergraduate_profile
      when 1;	"Two-year, higher part-time"
      when 2;	"Two-year, mixed part/full-time"
      when 3;	"Two-year, medium full-time"
      when 4;	"Two-year, higher full-time"
      when 5;	"Four-year, higher part-time"
      when 6;	"Four-year, medium full-time, inclusive, lower transfer-in"
      when 7;	"Four-year, medium full-time, inclusive, higher transfer-in"
      when 8;	"Four-year, medium full-time, selective, lower transfer-in"
      when 9;	"Four-year, medium full-time , selective, higher transfer-in"
      when 10;	"Four-year, full-time, inclusive, lower transfer-in"
      when 11;	"Four-year, full-time, inclusive, higher transfer-in"
      when 12;	"Four-year, full-time, selective, lower transfer-in"
      when 13;	"Four-year, full-time, selective, higher transfer-in"
      when 14;	"Four-year, full-time, more selective, lower transfer-in"
      when 15;	"Four-year, full-time, more selective, higher transfer-in"
      when 0, -2; "N/A"
    end
  end

  def level_name
    case level
    when 1; '4 or more years'
    when 2; 'At least 2 but less than 4 years'
    when 3; 'Less than 2 years'
    when -3; 'Unknown'
    end
  end

  def highest_offering_name
    case highest_offering
    when 1;	"Award of less than one academic year"
    when 2;	"At least 1, but less than 2 academic years"
    when 3;	"Associate's degree"
    when 4;	"At least 2, but less than 4 academic years"
    when 5;	"Bachelor's degree"
    when 6;	"Postbaccalaureate certificate"
    when 7;	"Master's degree"
    when 8;	"Post-master's certificate"
    when 9;	"Doctor's degree"
    when -3; "Not available"
    end
  end

  def size_category_name
    case size_category
    when 1; 'Under 1,000'
    when 2; '1,000 - 4,999'
    when 3; '5,000 - 9,999'
    when 4; '10,000 - 19,999'
    when 5; '20,000 and above'
    when -1; 'Not Reported'
    when -2; 'N/A'
    end
  end

end

class BasicHousingAllowance < ApplicationRecord
  validates :zip,
    uniqueness: true
end

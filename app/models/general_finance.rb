class GeneralFinance < ApplicationRecord
  belongs_to :school

  validates :school_id,
    uniqueness: { scope: :year }
end

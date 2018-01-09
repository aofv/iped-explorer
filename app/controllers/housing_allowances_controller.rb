class HousingAllowancesController < ApplicationController

  # GET /schools/:school_id/housing_allowance
  def show
    @allowance = BasicHousingAllowance.where(
      zip: School.find(params[:school_id]).zip
    ).first
  end

end

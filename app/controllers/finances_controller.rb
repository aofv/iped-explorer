class FinancesController < ApplicationController

  # GET /schools/:school_id/finances
  def index
    @school = School.find(params[:school_id])
    @finances = @school.general_finances.order(year: :asc)
  end

end

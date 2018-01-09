class CostsController < ApplicationController

  # GET /schools/:school_id/costs
  def index
    @costs = School.find(params[:school_id])
      .costs
      .order(year: :desc)
  end

end

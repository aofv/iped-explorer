class VeteransController < ApplicationController

  # GET /schools/:school_id/veteras
  def index
    @veterans = School.find(params[:school_id])
      .veterans
      .order(year: :desc)
  end

end

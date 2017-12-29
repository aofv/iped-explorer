class AdmissionsController < ApplicationController

  # GET /schools/:school_id/admissions
  def index
    @school = School.find(params[:school_id])
    @admissions = @school.admissions.order(year: :desc)
  end
end

class EnrollmentsController < ApplicationController

  # GET /schools/:school_id/enrollments
  def index
    @enrollments = School.find(params[:school_id])
      .enrollments
      .all_students
      .order(year: :desc)
  end

end

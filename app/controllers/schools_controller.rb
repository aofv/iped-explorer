class SchoolsController < ApplicationController

  # GET /schools
  def index
    @records_per_page = 50
    @current_page = 1
    @schools = School.all.page(@current_page).per(@records_per_page)
  end

end

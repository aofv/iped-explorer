class SchoolsController < ApplicationController

  # GET /schools
  def index
    @records_per_page = 50
    @current_page = 1
    @schools = SchoolSearchService.new.search(params, @records_per_page, @current_page)
  end

end

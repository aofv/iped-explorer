class SchoolsController < ApplicationController

  # GET /schools
  def index
    @records_per_page = params[:records_per_page] || 10
    @current_page = params[:current_page] ||  1
    @schools = SchoolSearchService.new.search(params, @records_per_page, @current_page)
  end

end

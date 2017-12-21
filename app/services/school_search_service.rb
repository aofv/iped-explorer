class SchoolSearchService

  def search(params, records_per_page, page_number)
    records_per_page = 50 if records_per_page > 50

    # only includes degree granting schools for now
    schools = School.grants_degrees

    if params[:control]
      schools = schools.where(control: params[:control].split(','))
    end

    if params[:region]
      schools = schools.where(region: params[:region].split(','))
    end

    if params[:size]
      schools = schools.where(size_category: params[:size].split(','))
    end

    if params[:highest_award]
      schools = schools.where(highest_offering: params[:highest_award].split(','))
    end

    return schools.page(page_number).per(records_per_page)
  end

end

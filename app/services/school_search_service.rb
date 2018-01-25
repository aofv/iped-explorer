class SchoolSearchService

  def search(params, records_per_page, page_number)
    records_per_page = 50 if records_per_page > 50

    # only includes degree granting schools for now
    schools = School.grants_degrees

    if params[:name]
      schools = schools.where("name ILIKE ?", "%#{params[:name]}%")
    end

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

    if params[:state]
      schools = schools.where(state: params[:state].split(','))
    end

    if params[:sport]
      school_ids = SportTeam.most_recent
        .select(:school_id).distinct
        .where(sport: params[:sport].split(','))

      schools = schools.where(id: school_ids)
    end

    if params[:affiliation]
      school_ids = SportTeam.most_recent
        .select(:school_id).distinct
        .where(affiliation: params[:affiliation].split(','))

      schools = schools.where(id: school_ids)
    end

    if params[:division]
      school_ids = SportTeam.most_recent
        .select(:school_id).distinct
        .where(division: params[:division].split(','))

      schools = schools.where(id: school_ids)
    end

    # Used for interna searches we want to hide NCAA D1 schools
    if params[:exclude_d1]
      schools =
    end

    return schools.page(page_number).per(records_per_page)
  end

end

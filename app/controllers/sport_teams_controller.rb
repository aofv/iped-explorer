class SportTeamsController < ApplicationController

  # GET /schools/:school_id/sport_teams
  def index
    @school = School.find(params[:school_id])
    @teams = @school.sport_teams
  end

end

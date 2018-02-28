class DegreeProgramsController < ApplicationController

  # GET /schools/:school_id/degree_programs
  def index
    @programs = School.find(params[:school_id])
      .degree_program_mappings
      .includes(:degree_program)
  end

  # GET /degree_programs/:id
  def show
    @program = DegreeProgram.find(params[:id])
  end

end

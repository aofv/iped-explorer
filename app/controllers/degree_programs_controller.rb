class DegreeProgramsController < ApplicationController

  # GET /schools/:school_id/degree_programs
  def index
    if params[:school_id]
      @programs = School.find(params[:school_id])
      .degree_program_mappings
      .includes(:degree_program)

      render 'mapped_index'
    else
      if params[:cip_parent].blank?
        # no parent param, so pass all of the top level cips
        @programs = DegreeProgram.where(is_parent: true)
      else
        # return the direct children of this parent
      end
    end
  end

  # GET /degree_programs/:id
  def show
    @program = DegreeProgram.find(params[:id])
  end

end

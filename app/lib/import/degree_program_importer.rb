require 'csv'
require 'open-uri'

module Import

  class DegreeProgramImporter

    def import
      puts "Importing CIP codes (degree programs)".titlecase

      location = 'https://s3.amazonaws.com/iped-data/explorer/cdep/cip_codes.csv'
      contents = open(location).read
      csv = CSV.parse(contents)

      is_first_row = true
      csv.each do |row|
        if is_first_row
          is_first_row = false
        else
          program = program_from_row(row)
          program.save
        end # END first row check
      end # END loop
    end # END import

    private

      def program_from_row(row)
        program = DegreeProgram.new
        program.cip_family = row[0]
        program.cip_code = row[1]
        program.title = row[4]
        program.description = row[5]
        program.is_parent = program.cip_family == program.cip_code

        if program.is_parent
          program.title = program.title.titlecase
        end

        if(program.title.rindex('.'))
          program.title = program.title[0..program.title.rindex('.') - 1]
        end

        program
      end
      
  end # END class

end # END module

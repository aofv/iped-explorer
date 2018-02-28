require 'csv'
require 'open-uri'

module Import

  class DegreeProgramMapper
    MAPPINGS = {}

    def import
      puts 'Mapping degree programs to schools'

      file_location = 'https://s3.amazonaws.com/iped-data/explorer/cdep/2016.csv'
      puts "\tDownloading File"
      contents = open(file_location).read
      puts "\tParsing File"
      csv = CSV.parse(contents)

      is_first_row = true
      csv.each do |row|
        if is_first_row
          is_first_row = false

          stripped = row.map { |r| r.strip.upcase }

          MAPPINGS[:school_uid] = row[0]
          MAPPINGS[:cip_code] = stripped.index('CIPCODE')
          MAPPINGS[:bachelor] = stripped.index('PBACHL')
          MAPPINGS[:associate] = stripped.index('PASSOC')
          MAPPINGS[:master] = stripped.index('PMASTR')
          MAPPINGS[:doctorate] = stripped.index('PDOCRS')
          MAPPINGS[:distance] = stripped.index('PTOTALDE')
        else
          school = School.where(uid: row[0]).first
          build_item(row, school).save
        end # END first row check
      end # END loop
    end # END import

    private

      def build_item(row, school)
        item = DegreeProgramMapping.new

        item.school = school
        item.degree_program = DegreeProgram.where(cip_code: row[MAPPINGS[:cip_code]]).first
        item.associate = row[MAPPINGS[:associate]] != '0'
        item.bachelor = row[MAPPINGS[:bachelor]] != '0'
        item.master = row[MAPPINGS[:master]] != '0'
        item.doctorate = row[MAPPINGS[:doctorate]] != '0'
        item.distance = row[MAPPINGS[:distance]] != '0'

        return item
      end # END build_item

    # END private

  end # END class

end # END module

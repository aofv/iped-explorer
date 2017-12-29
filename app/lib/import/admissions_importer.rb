require 'csv'
require 'open-uri'

module Import

  class AdmissionsImporter
    IMPORT_START_YEAR=2009
    IMPORT_END_YEAR=2016
    MAPPINGS = {}

    def import
      puts "Importing addmissions data"

      current_year = IMPORT_START_YEAR

      while current_year <= IMPORT_END_YEAR
        url = URI("https://s3.amazonaws.com/iped-data/explorer/adm/#{current_year}.csv")
        puts "Importing for year #{current_year}"
        contents = open(url).read

        total_rows = contents.count("\r")
        current_record = 0

        CSV.parse(contents).each do |row|
          if current_record == 0
            stripped = row.map { |r| r.strip }
            MAPPINGS[:applications_male] = stripped.index('APPLCNM')
            MAPPINGS[:applications_female] = stripped.index('APPLCNW')
            MAPPINGS[:admissions_male] = stripped.index('ADMSSNM')
            MAPPINGS[:admissions_female] = stripped.index('ADMSSNW')
          else
            uid = row[0]
            print "\033[K Importing #{current_record} of #{total_rows}\r"

            school = School.where(uid: row[0]).first
            unless school.nil?
              new_item = build_item(row, school, current_year)
              new_item.save
            end
          end # END current record not 1 check
          current_record = current_record + 1
        end # END CSV parse loop

      end # END while loop
    end # END import method

    private

      def build_item(row, school, year)
        item = Admission.new

        item.school = school
        item.year = year

        item.applications_male = row[MAPPINGS[:applications_male]]
        item.applications_female = row[MAPPINGS[:applications_female]]
        item.admissions_male = row[MAPPINGS[:admissions_male]]
        item.admissions_female = row[MAPPINGS[:admissions_female]]

        item.admissions = item.admissions_female.to_i + item.admissions_male.to_i
        item.applications = item.applications_female.to_i + item.admissions_male.to_i

        return item
      end
  end # END class

end # END module

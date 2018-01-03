require 'csv'
require 'open-uri'

module Import

  class VeteranImporter
    IMPORT_START_YEAR = 2014
    IMPORT_END_YEAR = 2016
    MAPPINGS = {}

    def import
      puts "Importing veteran benefit information"

      current_year = IMPORT_START_YEAR
      while current_year <= IMPORT_END_YEAR
        puts "Importing for year #{current_year}"
        contents = open(URI("https://s3.amazonaws.com/iped-data/explorer/sfav/#{current_year}.csv")).read

        total_rows = contents.count("\r")
        current_row = 0
        CSV.parse(contents).each do |row|
          if current_row == 0
            stripped = row.map { |r| r.strip.upcase }

            MAPPINGS[:total_undergarduate_students] = stripped.index('UGPO9_N')
            MAPPINGS[:total_undergraduate_benefits] = stripped.index('UGPO9_T')
            MAPPINGS[:average_undergraduate_benefits] = stripped.index('UGPO9_A')
            MAPPINGS[:total_graduate_students] = stripped.index('GPO9_N')
            MAPPINGS[:total_graduate_benifits] = stripped.index('GPO9_T')
            MAPPINGS[:average_graduate_benifits] = stripped.index('GPO9_A')
            MAPPINGS[:total_students] = stripped.index('PO9_N')
            MAPPINGS[:total_benefits] = stripped.index('PO9_T')
            MAPPINGS[:average_benefits] = stripped.index('PO9_A')
          else
            uid = row[0]
            print "\033[K Importing #{current_row} of #{total_rows}\r"
            school = School.where(uid: uid).first
            unless school.nil?
              new_item = build_item(row, school, current_year)
              new_item.save
            end
          end

          current_row = current_row + 1
        end # END row loop

        current_year = current_year + 1
      end # END year loop

    end # END import method

    private

      def build_item(row, school, year)
        item = Veteran.new

        item.school = school
        item.year = year

        item.total_undergarduate_students = row[MAPPINGS[:total_undergarduate_students]]
        item.total_undergraduate_benefits = row[MAPPINGS[:total_undergraduate_benefits]]
        item.average_undergraduate_benefits = row[MAPPINGS[:average_undergraduate_benefits]]
        item.total_graduate_students = row[MAPPINGS[:total_graduate_students]]
        item.total_graduate_benifits = row[MAPPINGS[:total_graduate_benifits]]
        item.average_graduate_benifits = row[MAPPINGS[:average_graduate_benifits]]
        item.total_students = row[MAPPINGS[:total_students]]
        item.total_benefits = row[MAPPINGS[:total_benefits]]
        item.average_benefits = row[MAPPINGS[:average_benefits]]

        return item
      end # END build_item

  end # END class
end # END module

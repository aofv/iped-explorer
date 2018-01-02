require 'csv'
require 'open-uri'

module Import

  class EnrollmentImporter
    IMPORT_START_YEAR = 2009
    IMPORT_END_YEAR = 2016
    MAPPINGS = {}

    def import
      puts "Importing enrollment data"

      current_year = IMPORT_START_YEAR
      while current_year <= IMPORT_END_YEAR
        puts "Importing for year #{current_year}"
        contents = open(URI("https://s3.amazonaws.com/iped-data/explorer/effy/#{current_year}.csv")).read

        total_rows = contents.count("\r")
        current_row = 0
        CSV.parse(contents).each do |row|
          if current_row == 0
            stripped = row.map { |r| r.strip.upcase }

            MAPPINGS[:level_of_student] = stripped.index('LSTUDY')
            MAPPINGS[:total] = stripped.index('EFYTOTLT')
            MAPPINGS[:male]  = stripped.index('EFYTOTLM')
            MAPPINGS[:female] = stripped.index('EFYTOTLW')
            MAPPINGS[:american_indian] = stripped.index('EFYAIANT')
            MAPPINGS[:american_indian_male] = stripped.index('EFYAIANM')
            MAPPINGS[:american_indian_female] = stripped.index('EFYAIANW')
            MAPPINGS[:asian] = stripped.index('EFYASIAT')
            MAPPINGS[:asian_male] = stripped.index('EFYASIAM')
            MAPPINGS[:asian_female] = stripped.index('EFYASIAW')
            MAPPINGS[:african_american] = stripped.index('EFYBKAAT')
            MAPPINGS[:african_american_male] = stripped.index('EFYBKAAM')
            MAPPINGS[:african_american_female] = stripped.index('EFYBKAAW')
            MAPPINGS[:hispanic] = stripped.index('EFYHISPT')
            MAPPINGS[:hispanic_male] = stripped.index('EFYHISPM')
            MAPPINGS[:hispanic_female] = stripped.index('EFYHISPW')
            MAPPINGS[:pacific_islander] = stripped.index('EFYNHPIT')
            MAPPINGS[:pacific_islander_male] = stripped.index('EFYNHPIM')
            MAPPINGS[:pacific_islander_female] = stripped.index('EFYNHPIW')
            MAPPINGS[:white] = stripped.index('EFYWHITT')
            MAPPINGS[:white_male] = stripped.index('EFYWHITM')
            MAPPINGS[:white_female] = stripped.index('EFYWHITW')
            MAPPINGS[:two_races] = stripped.index('EFY2MORT')
            MAPPINGS[:two_races_male] = stripped.index('EFY2MORM')
            MAPPINGS[:two_races_women] = stripped.index('EFY2MORW')
            MAPPINGS[:race_unknown] = stripped.index('EFYUNKNT')
            MAPPINGS[:race_unknown_male] = stripped.index('EFYUNKNM')
            MAPPINGS[:race_unknown_female] = stripped.index('EFYUNKNW')
            MAPPINGS[:non_resident] = stripped.index('EFYNRALT')
            MAPPINGS[:non_resident_male] = stripped.index('EFYNRALM')
            MAPPINGS[:non_resident_female] = stripped.index('EFYNRALW')
          else
            uid = row[0]
            print "\033[K Importing #{current_row} of #{total_rows}\r"
            school = School.where(uid: uid).first
            unless school.nil?
              new_item = build_item(row, school, current_year)
              new_item.save
            end

          end # END row if
          current_row = current_row + 1
        end # END row loop
        current_year = current_year + 1
      end # END while loop
    end # END import method

    private

      def build_item(row, school, year)
        item = Enrollment.new

        item.school = school
        item.year = year

        item.level_of_student = row[MAPPINGS[:level_of_student]]
        item.total = row[MAPPINGS[:total]]
        item.male = row[MAPPINGS[:male]]
        item.female = row[MAPPINGS[:female]]
        item.american_indian = row[MAPPINGS[:american_indian]]
        item.american_indian_male = row[MAPPINGS[:american_indian_male]]
        item.american_indian_female = row[MAPPINGS[:american_indian_female]]
        item.asian = row[MAPPINGS[:asian]]
        item.asian_male = row[MAPPINGS[:asian_male]]
        item.asian_female = row[MAPPINGS[:asian_female]]
        item.african_american = row[MAPPINGS[:african_american]]
        item.african_american_male = row[MAPPINGS[:african_american_male]]
        item.african_american_female = row[MAPPINGS[:african_american_female]]
        item.hispanic = row[MAPPINGS[:hispanic]]
        item.hispanic_male = row[MAPPINGS[:hispanic_male]]
        item.hispanic_female = row[MAPPINGS[:hispanic_female]]
        item.pacific_islander = row[MAPPINGS[:pacific_islander]]
        item.pacific_islander_male = row[MAPPINGS[:pacific_islander_male]]
        item.pacific_islander_female = row[MAPPINGS[:pacific_islander_female]]
        item.white = row[MAPPINGS[:white]]
        item.white_male = row[MAPPINGS[:white_male]]
        item.white_female = row[MAPPINGS[:white_female]]
        item.two_races = row[MAPPINGS[:two_races]]
        item.two_races_male = row[MAPPINGS[:two_races_male]]
        item.two_races_women = row[MAPPINGS[:two_races_women]]
        item.race_unknown = row[MAPPINGS[:race_unknown]]
        item.race_unknown_male = row[MAPPINGS[:race_unknown_male]]
        item.race_unknown_female = row[MAPPINGS[:race_unknown_female]]
        item.non_resident = row[MAPPINGS[:non_resident]]
        item.non_resident_male = row[MAPPINGS[:non_resident_male]]
        item.non_resident_female = row[MAPPINGS[:non_resident_female]]

        return item
      end # END build_item

  end # END class

end # END module

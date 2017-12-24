require 'csv'
require 'open-uri'

module Import

  class SportsDataImporter
    IMPORT_START_YEAR=2016
    IMPORT_END_YEAR=2016

    def import
      import_teams
    end

    private

      def import_teams
        puts "Importing team data"

        current_year = IMPORT_START_YEAR
        while current_year <= IMPORT_END_YEAR
          url = URI("https://s3.amazonaws.com/iped-data/#{current_year}/sports.csv")
          contents = open(url).read

          total_rows = contents.count("\r")
          current_record = 0

          CSV.parse(contents).each do |row|
            unless current_record < 1
              uid = row[0]
              print "\033[K Importing #{current_record} of #{total_rows} - #{row[1]} #{row[127]} \r"

              imported = true
              if School.where(uid: uid).first
                imported = School.where(uid: uid).first.sport_teams.where(year: current_year, sport: row[127]).exists?
              end

              unless imported
                new_team = build_team(row, current_year)

                new_team.save
              end
            end
            current_record = current_record + 1
          end

          current_year = current_year + 1
        end
      end

      def build_team(row, year)
        team = SportTeam.new

        team.year = year
        team.affiliation = row[8].split('Division')[0]

        team.division = 'Division I' if row[8].index("Division I")
        team.division = 'Division II' if row[8].index("Division II")
        team.division = 'Division III' if row[8].index("Division III")

        team.school = School.where(uid: row[0]).first
        team.sport = row[127]
        team.roster_size = row[20].to_i + row[21].to_i
        team.expenses = row[22].to_i + row[24].to_i
        team.revenue = row[115].to_i + row[116].to_i

        team
      end

  end

end

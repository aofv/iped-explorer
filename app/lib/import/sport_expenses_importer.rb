require 'csv'
require 'open-uri'

module Import

  class SportExpensesImporter
    IMPORT_START_YEAR=2016
    IMPORT_END_YEAR=2016


    def import
      puts "Importing expense data"

      current_year = IMPORT_START_YEAR
      while current_year <= IMPORT_END_YEAR
        url = URI("https://s3.amazonaws.com/iped-data/explorer/sports/inst-level/#{current_year}.csv")
        contents = open(url).read
        puts "Importing data for year #{current_year}"
        current_year = current_year + 1

        total_rows = contents.count("\r")
        current_record = 0

        CSV.parse(contents).each do |row|
          unless current_record < 1
            print "\033[K Importing #{current_record + 1} of #{total_rows} \r"

            school = School.where(uid: row[0]).first
            unless school.nil?
              new_item = build_expense(row, school, current_year)
              new_item.save
            end
          end
          current_record = current_record + 1

        end
      end
    end

    private

      def build_expense(row, school, year)
        item = SportExpenses.new

        item.school = school
        item.student_aid_total = row[18]
        item.recruiting_men = row[23]
        item.recruiting_women = row[24]
        item.recruiting_total = row[26]
        item.total_revenue = row[165]
        item.total_expenses = row[166]
        item.year = year

        return item
      end

  end

end

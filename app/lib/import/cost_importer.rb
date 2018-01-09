require 'csv'
require 'open-uri'

module Import

  class CostImporter
    IMPORT_START_YEAR = 2008
    IMPORT_END_YEAR = 2016
    MAPPINGS = {}

    def import
      puts "Importing cost data"

      current_year = IMPORT_START_YEAR
      while current_year <= IMPORT_END_YEAR
        puts "Importing for year #{current_year}"
        contents = open(URI("https://s3.amazonaws.com/iped-data/explorer/ic_ay/#{current_year}.csv")).read

        total_rows = contents.count("\r")
        current_row = 0
        CSV.parse(contents).each do |row|
          if current_row == 0
            stripped = row.map { |r| r.strip.upcase }

            MAPPINGS[:average_in_state_tuition] = stripped.index('TUITION2')
            MAPPINGS[:in_state_fees] = stripped.index('FEE2')
            MAPPINGS[:average_out_of_state_tuition] = stripped.index('TUITION3')
            MAPPINGS[:out_of_stats_fees] = stripped.index('FEE3')
            MAPPINGS[:books_and_supplies] = stripped.index('CHG4AY3')
            MAPPINGS[:on_campus_room_and_board] = stripped.index('CHG5AY3')
            MAPPINGS[:off_campus_room_and_board] = stripped.index('CHG7AY3')
          else
            print "\033[K Importing #{current_row} of #{total_rows}\r"
            uid = row[0]
            school = School.where(uid: uid).first
            unless school.nil?
              build_item(row, school, current_year).save
            end
          end

          current_row = current_row + 1
        end # END row loop

        current_year = current_year + 1
      end # END while loop

    end # END import method

    private

      def build_item(row, school, year)
        item = Cost.new

        item.school = school
        item.year = year

        item.average_in_state_tuition = row[MAPPINGS[:average_in_state_tuition]]
        item.in_state_fees = row[MAPPINGS[:in_state_fees]]
        item.average_out_of_state_tuition = row[MAPPINGS[:average_out_of_state_tuition]]
        item.out_of_stats_fees = row[MAPPINGS[:out_of_stats_fees]]
        item.books_and_supplies = row[MAPPINGS[:books_and_supplies]]
        item.on_campus_room_and_board = row[MAPPINGS[:on_campus_room_and_board]]
        item.off_campus_room_and_board = row[MAPPINGS[:off_campus_room_and_board]]

        return item
      end

    # END private methods

  end # END class

end # END module

require 'csv'
require 'open-uri'

module Import

  class PublicGeneralFinanceImporter
    IMPORT_START_YEAR=2010
    IMPORT_END_YEAR=2016
    MAPPINGS = {}

    def import
      puts "Importing finance data for public schools"

      current_year = IMPORT_START_YEAR
      while current_year <= IMPORT_END_YEAR
        url = URI("https://s3.amazonaws.com/iped-data/explorer/f1a/#{current_year}.csv")
        puts "Importing for year #{current_year}"
        contents = open(url).read

        total_rows = contents.count("\r")
        current_record = 0

        CSV.parse(contents).each do |row|
          if current_record == 0
            stripped = row.map { |r| r.strip }
            MAPPINGS['assets'] = stripped.index('F1A06')
            MAPPINGS['expenses'] = stripped.index('F1D02')
            MAPPINGS['liabilities'] = stripped.index('F1A13')
            MAPPINGS['tuition_revenue'] = stripped.index('F1B09')
            MAPPINGS['total_revenue'] = stripped.index('F1D01')
            MAPPINGS['donations'] = stripped.index('F1B16')
            MAPPINGS['discounts'] = stripped.index('F1E08')
            MAPPINGS['endowment'] = stripped.index('F1H02')
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

        current_year = current_year + 1
      end # END year loop
    end # END import method

    private

      def build_item(row, school, year)
        item = GeneralFinance.new

        item.school = school
        item.year = year
        item.total_assets = row[MAPPINGS['assets']]
        item.total_expenses = row[MAPPINGS['expenses']]
        item.total_liabilities = row[MAPPINGS['liabilities']]
        item.tuition_revenue = row[MAPPINGS['tuition_revenue']]
        item.total_revenue = row[MAPPINGS['total_revenue']]
        item.donations = row[MAPPINGS['donations']]
        item.total_discounts = row[MAPPINGS['discounts']]
        item.value_of_endowment = row[MAPPINGS['endowment']]

        return item
      end

  end # END class

end # END module

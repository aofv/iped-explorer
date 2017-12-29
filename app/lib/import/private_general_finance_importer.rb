require 'csv'
require 'open-uri'

module Import

  class PrivateGeneralFinanceImporter
    IMPORT_START_YEAR=2010
    IMPORT_END_YEAR=2016
    MAPPINGS = {}

    def import
      puts "Importing finance data for private schools"

      current_year = IMPORT_START_YEAR
      while current_year <= IMPORT_END_YEAR
        url = URI("https://s3.amazonaws.com/iped-data/explorer/f2/#{current_year}.csv")
        puts "Importing for year #{current_year}"
        contents = open(url).read

        total_rows = contents.count("\r")
        current_record = 0

        CSV.parse(contents).each do |row|
          if current_record == 0
            stripped = row.map { |r| r.strip }
            MAPPINGS['assets'] = stripped.index('F2A02')
            MAPPINGS['expenses'] = stripped.index('F2E131')
            MAPPINGS['liabilities'] = stripped.index('F2A03')
            MAPPINGS['tuition_revenue'] = stripped.index('F2D01')
            MAPPINGS['total_revenue'] = stripped.index('F2D16')
            MAPPINGS['donations'] = stripped.index('F2D08A')
            MAPPINGS['discounts'] = stripped.index('F2C08')
            MAPPINGS['endowment'] = stripped.index('F2H02')
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

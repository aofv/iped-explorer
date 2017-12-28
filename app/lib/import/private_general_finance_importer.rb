require 'csv'
require 'open-uri'

module Import

  class PrivateGeneralFinanceImporter
    IMPORT_START_YEAR=2010
    IMPORT_END_YEAR=2016

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
          unless current_record < 1
            uid = row[0]
            print "\033[K Importing #{current_record} of #{total_rows}\r"

            school = School.where(uid: row[0]).first
            unless school.nil?
              new_item = case current_year
              when 2016; build_item_for_2016(row, school,current_year)
              when 2011,2012,2013,2014,2015; build_item_for_2011_to_2015(row, school, current_year)
              when 2010; build_item_for_2010(row, school, current_year)
              end

              new_item.save
            end
          end # END current record not 1 check
          current_record = current_record + 1
        end # END CSV parse loop

        current_year = current_year + 1
      end # END year loop
    end # END import method

    private

      def build_item_for_2016(row, school, year)
        item = GeneralFinance.new

        item.school = school
        item.year = year

        item.total_assets = row[4]
        item.total_long_term_debt = row[6]
        item.total_liabilities = row[5]
        item.tuition_revenue = row[36]
        item.total_revenue = row[20]
        item.donations = row[64]
        item.instruction_expenses = row[110]
        item.instruction_salaries = row[111]
        item.research_expenses = row[112]
        item.research_salaries = row[113]
        item.academic_support_expenses = row[116]
        item.academic_support_salaries = row[117]
        item.student_services_expenses = row[118]
        item.student_services_salaries = row[119]
        item.institutional_support_expenses = row[120]
        item.institutional_support_salaries = row[121]
        item.aux_expenses = row[122]
        item.aux_salaries = row[123]
        item.total_discounts = row[35]
        item.value_of_endowment = row[140]

        return item
      end

      def build_item_for_2011_to_2015(row, school, year)
        item = GeneralFinance.new

        item.school = school
        item.year = year

        item.total_assets = row[2]
        item.total_long_term_debt = row[4]
        item.total_liabilities = row[3]
        item.tuition_revenue = row[35]
        item.total_revenue = row[97]
        item.donations = row[67]
        item.instruction_expenses = row[109]
        item.instruction_salaries = row[110]
        item.research_expenses = row[116]
        item.research_salaries = row[117]
        item.academic_support_expenses = row[130]
        item.academic_support_salaries = row[131]
        item.student_services_expenses = row[137]
        item.student_services_salaries = row[138]
        item.institutional_support_expenses = row[144]
        item.institutional_support_salaries = row[145]
        item.aux_expenses = row[151]
        item.aux_salaries = row[152]
        item.total_discounts = row[33]
        item.value_of_endowment = row[197]

        return item
      end

      def build_item_for_2010(row, school, year)
        item = GeneralFinance.new

        item.school = school
        item.year = year

        item.total_assets = row[2]
        item.total_long_term_debt = row[4]
        item.total_liabilities = row[3]
        item.tuition_revenue = row[35]
        item.total_revenue = row[97]
        item.donations = row[67]
        item.instruction_expenses = row[109]
        item.instruction_salaries = row[110]
        item.research_expenses = row[116]
        item.research_salaries = row[117]
        item.academic_support_expenses = row[130]
        item.academic_support_salaries = row[131]
        item.student_services_expenses = row[137]
        item.student_services_salaries = row[138]
        item.institutional_support_expenses = row[144]
        item.institutional_support_salaries = row[145]
        item.aux_expenses = row[151]
        item.aux_salaries = row[152]
        item.total_discounts = row[33]
        item.value_of_endowment = row[197]

        return item
      end

  end # END class
end # END module

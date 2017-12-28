require 'csv'
require 'open-uri'

module Import

  class PublicGeneralFinanceImporter
    IMPORT_START_YEAR=2010
    IMPORT_END_YEAR=2016

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
          unless current_record < 1
            uid = row[0]
            print "\033[K Importing #{current_record} of #{total_rows}\r"

            school = School.where(uid: row[0]).first
            unless school.nil?
              new_item = case current_year
              when 2010; build_item_2010(row, school, current_year)
              when 2011,2012,2013,2014; build_item_2011_to_2014(row, school, current_year)
              when 2015; build_item_2015(row, school, current_year)
              when 2016; build_item_2016(row, school, current_year)
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

      def build_item_2016(row, school, year)
        item = GeneralFinance.new

        item.school = school
        item.year = year

        item.total_assets = row[5]
        item.total_long_term_debt = row[10]
        item.total_liabilities = row[13]
        item.tuition_revenue = row[35]
        item.total_revenue = row[46]
        item.donations = row[53]
        item.instruction_expenses = row[64]
        item.instruction_salaries = row[65]
        item.research_expenses = row[66]
        item.research_salaries = row[67]
        item.academic_support_expenses = row[70]
        item.academic_support_salaries = row[71]
        item.student_services_expenses = row[72]
        item.student_services_salaries = row[73]
        item.institutional_support_expenses = row[74]
        item.institutional_support_salaries = row[75]
        item.aux_expenses = row[77]
        item.aux_salaries = row[78]
        item.total_discounts = row[104]
        item.value_of_endowment = row[110]

        return item
      end

      def build_item_2015(row, school, year)
        item = GeneralFinance.new

        item.school = school
        item.year = year

        item.total_assets = row[5]
        item.total_long_term_debt = row[9]
        item.total_liabilities = row[12]
        item.tuition_revenue = row[27]
        item.total_revenue = row[38]
        item.donations = row[45]
        item.instruction_expenses = row[56]
        item.instruction_salaries = row[57]
        item.research_expenses = row[63]
        item.research_salaries = row[64]
        item.academic_support_expenses = row[77]
        item.academic_support_salaries = row[78]
        item.student_services_expenses = row[84]
        item.student_services_salaries = row[85]
        item.institutional_support_expenses = row[91]
        item.institutional_support_salaries = row[92]
        item.aux_expenses = row[107]
        item.aux_salaries = row[108]
        item.total_discounts = row[160]
        item.value_of_endowment = row[166]

        return item
      end

      def build_item_2011_to_2014(row, school, year)
        item = GeneralFinance.new

        item.school = school
        item.year = year

        item.total_assets = row[5]
        item.total_long_term_debt = row[9]
        item.total_liabilities = row[12]
        item.tuition_revenue = row[27]
        item.total_revenue = row[38]
        item.donations = row[45]
        item.instruction_expenses = row[56]
        item.instruction_salaries = row[57]
        item.research_expenses = row[63]
        item.research_salaries = row[64]
        item.academic_support_expenses = row[77]
        item.academic_support_salaries = row[78]
        item.student_services_expenses = row[84]
        item.student_services_salaries = row[85]
        item.institutional_support_expenses = row[91]
        item.institutional_support_salaries = row[92]
        item.aux_expenses = row[107]
        item.aux_salaries = row[108]
        item.total_discounts = row[155]
        item.value_of_endowment = row[161]

        return item
      end

      def build_item_2010(row, school, year)
        item = GeneralFinance.new

        item.school = school
        item.year = year

        item.total_assets = row[5]
        item.total_long_term_debt = row[9]
        item.total_liabilities = row[12]
        item.tuition_revenue = row[27]
        item.total_revenue = row[38]
        item.donations = row[45]
        item.instruction_expenses = row[56]
        item.instruction_salaries = row[57]
        item.research_expenses = row[63]
        item.research_salaries = row[64]
        item.academic_support_expenses = row[77]
        item.academic_support_salaries = row[78]
        item.student_services_expenses = row[84]
        item.student_services_salaries = row[85]
        item.institutional_support_expenses = row[91]
        item.institutional_support_salaries = row[92]
        item.aux_expenses = row[107]
        item.aux_salaries = row[108]
        item.total_discounts = row[155]
        item.value_of_endowment = row[159]

        return item
      end
  end # END class

end # END module

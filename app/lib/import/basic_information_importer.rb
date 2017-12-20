require 'csv'

module Import
  class BasicInformationImporter

    def import
      clear_line = "\033[K"
      puts "Starting basic information import"

      contents = File.read("#{Rails.root}/db/raw_data/basic_2016.csv")
      total_records = contents.count("\r")
      current_record = 0

      CSV.parse(contents).each do |row|
        unless current_record < 1
          print "#{clear_line} Importing #{current_record} of #{total_records} - #{row[1]}\r"
        end

        unless school_exists?(row)
          new_school = build_school(row)
          new_school.save
        end

        current_record = current_record + 1
      end

      puts "\n\n"
    end

    private

      def school_exists?(row)
        School.exists?(row[0])
      end

      def build_school(row)
        school = School.new

        school.uid = row[0]
        school.name = row[1]
        school.address = row[3]
        school.city = row[4]
        school.state = row[5]
        school.zip = row[6]
        school.lat = row[69]
        school.lon = row[68]
        school.region = row[8]
        school.chief_administrator = row[9]
        school.chief_administrator_title = row[10]
        school.website = row[16]
        school.control = row[26]
        school.sector = row[24]
        school.level = row[25]
        school.highest_offering = row[27]
        school.has_undergraduate_degrees = row[28] == '1'
        school.has_graduate_degrees = row[29] == '1'
        school.grants_degrees = row[31] == '1'
        school.is_hbc = row[32] == '1'
        school.has_medical_degrees = row[34] == '1'
        school.has_hospital = row[33] == '1'
        school.admissions_open_to_public = row[37] == '1'
        school.size_category = row[57]
        school.undergraduate_profile = row[51]
        school.enrollment_profile = row[52]

        return school
      end

  end
end

require 'csv'
require 'open-uri'

module Import

  class BahImporter
    MAPPINGS = {}
    @zip_mappings = {}
    RANKS = [
      :e01, :e02, :e03, :e04, :e05, :e06, :e07, :e08, :e09,
      # :w01, :w02, :w03, :w04, :w05,
      # :o01, :o02, :o03, :o04, :o05, :o06, :o07,
    ]

    def import
      puts "Importing BAH Data (2018)"
      build_zip_mappings

      puts "\t Importing rates (with deps)"
      # with deps
      contents = open(URI('https://s3.amazonaws.com/iped-data/explorer/bah/bah_with.csv')).read
      total_rows = contents.count("\n")
      current_row = 0
      CSV.parse(contents).each do |row|
        print "\033[K Importing #{current_row} of #{total_rows}\r"
        if current_row == 0
          stripped = row.map { |r| r.nil? ? nil : r.strip.upcase }

          MAPPINGS[:mha] = stripped.index('MHA')
          MAPPINGS[:e01] = stripped.index('E01')
          MAPPINGS[:e02] = stripped.index('E02')
          MAPPINGS[:e03] = stripped.index('E03')
          MAPPINGS[:e04] = stripped.index('E04')
          MAPPINGS[:e05] = stripped.index('E05')
          MAPPINGS[:e06] = stripped.index('E06')
          MAPPINGS[:e07] = stripped.index('E07')
          MAPPINGS[:e08] = stripped.index('E08')
          MAPPINGS[:e09] = stripped.index('E09')

          MAPPINGS[:w01] = stripped.index('W01')
          MAPPINGS[:w02] = stripped.index('W02')
          MAPPINGS[:w03] = stripped.index('W03')
          MAPPINGS[:w04] = stripped.index('W04')
          MAPPINGS[:w05] = stripped.index('W05')

          MAPPINGS[:o01] = stripped.index('O01')
          MAPPINGS[:o02] = stripped.index('O02')
          MAPPINGS[:o03] = stripped.index('O03')
          MAPPINGS[:o04] = stripped.index('O04')
          MAPPINGS[:o05] = stripped.index('O05')
          MAPPINGS[:o06] = stripped.index('O06')
          MAPPINGS[:o07] = stripped.index('O07')

        else
          mha = row[MAPPINGS[:mha]]
          (@zip_mappings[mha] || []).each do |zip|
            item = BasicHousingAllowance.new
            item.zip = zip
            item.e01_with_deps = row[MAPPINGS[:e01]]
            item.e02_with_deps = row[MAPPINGS[:e02]]
            item.e03_with_deps = row[MAPPINGS[:e03]]
            item.e04_with_deps = row[MAPPINGS[:e04]]
            item.e05_with_deps = row[MAPPINGS[:e05]]
            item.e06_with_deps = row[MAPPINGS[:e06]]
            item.e07_with_deps = row[MAPPINGS[:e07]]
            item.e08_with_deps = row[MAPPINGS[:e08]]
            item.e09_with_deps = row[MAPPINGS[:e09]]
            item.save
          end # END zip loop
        end # END if current_row == 0
        current_row = current_row + 1
      end

      current_row = 0
      puts "\n\t Importing rates (no deps)"
      contents = open(URI('https://s3.amazonaws.com/iped-data/explorer/bah/bah_without.csv')).read
      total_rows = contents.count("\n")
      CSV.parse(contents).each do |row|
        print "\033[K Importing #{current_row} of #{total_rows}\r"
        if current_row == 0
          stripped = row.map { |r| r.nil? ? nil : r.strip.upcase }

          MAPPINGS[:mha] = stripped.index('MHA')
          MAPPINGS[:e01] = stripped.index('E01')
          MAPPINGS[:e02] = stripped.index('E02')
          MAPPINGS[:e03] = stripped.index('E03')
          MAPPINGS[:e04] = stripped.index('E04')
          MAPPINGS[:e05] = stripped.index('E05')
          MAPPINGS[:e06] = stripped.index('E06')
          MAPPINGS[:e07] = stripped.index('E07')
          MAPPINGS[:e08] = stripped.index('E08')
          MAPPINGS[:e09] = stripped.index('E09')

          MAPPINGS[:w01] = stripped.index('W01')
          MAPPINGS[:w02] = stripped.index('W02')
          MAPPINGS[:w03] = stripped.index('W03')
          MAPPINGS[:w04] = stripped.index('W04')
          MAPPINGS[:w05] = stripped.index('W05')

          MAPPINGS[:o01] = stripped.index('O01')
          MAPPINGS[:o02] = stripped.index('O02')
          MAPPINGS[:o03] = stripped.index('O03')
          MAPPINGS[:o04] = stripped.index('O04')
          MAPPINGS[:o05] = stripped.index('O05')
          MAPPINGS[:o06] = stripped.index('O06')
          MAPPINGS[:o07] = stripped.index('O07')

        else

          mha = row[MAPPINGS[:mha]]
          (@zip_mappings[mha] || []).each do |zip|
            item = BasicHousingAllowance.where(zip: zip).first
            item.e01_no_deps = row[MAPPINGS[:e01]]
            item.e02_no_deps = row[MAPPINGS[:e02]]
            item.e03_no_deps = row[MAPPINGS[:e03]]
            item.e04_no_deps = row[MAPPINGS[:e04]]
            item.e05_no_deps = row[MAPPINGS[:e05]]
            item.e06_no_deps = row[MAPPINGS[:e06]]
            item.e07_no_deps = row[MAPPINGS[:e07]]
            item.e08_no_deps = row[MAPPINGS[:e08]]
            item.e09_no_deps = row[MAPPINGS[:e09]]

            item.save
          end

        end # END if current_row == 0
        current_row = current_row + 1
      end


    end # END import method

    private

      def build_zip_mappings
        puts "\t Building ZIP to MHA mappings"
        contents = open(URI('https://s3.amazonaws.com/iped-data/explorer/bah/zip_mapping.txt'))
        mappings = {}

        contents.each_line do |line|
        parts = line.split(' ')
          zip = parts[0]
          mha = parts[1]
          mappings[mha] = [] if mappings[mha].nil?
          mappings[mha] << zip
        end # END line loop

        puts "\t Finished ZIP to MHA mappings"
        @zip_mappings = mappings
      end # END zip_mappings

    # END private methods

  end # END class

end # END module

namespace :iped do

  desc "Import all IPEDS data"
  task import_data: :environment do
    Import::BasicInformationImporter.new.import
    Import::SportsDataImporter.new.import
  end

end

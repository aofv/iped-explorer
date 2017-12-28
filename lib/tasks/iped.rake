namespace :iped do

  desc "Import all IPEDS data"
  task import_data: :environment do
    Import::BasicInformationImporter.new.import
    Import::SportsDataImporter.new.import
    Import::SportExpensesImporter.new.import
    Import::PublicGeneralFinanceImporter.new.import
    Import::PrivateGeneralFinanceImporter.new.import
  end

end

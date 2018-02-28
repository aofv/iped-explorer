namespace :iped do

  desc "Import all IPEDS data"
  task import_data: :environment do
    # Import::BasicInformationImporter.new.import
    # Import::SportsDataImporter.new.import
    # Import::SportExpensesImporter.new.import
    # Import::PublicGeneralFinanceImporter.new.import
    # Import::PrivateGeneralFinanceImporter.new.import
    # Import::AdmissionsImporter.new.import
    # Import::EnrollmentImporter.new.import
    # Import::VeteranImporter.new.import
    # Import::CostImporter.new.import
    # Import::BahImporter.new.import
    # Import::DegreeProgramImporter.new.import
    Import::DegreeProgramMapper.new.import
  end

end

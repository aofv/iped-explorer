class CreateAdmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :admissions do |t|
      t.integer :year
      t.references :school
      t.integer :applications
      t.integer :applications_male
      t.integer :applications_female
      t.integer :admissions
      t.integer :admissions_male
      t.integer :admissions_female

      t.timestamps
    end
  end
end

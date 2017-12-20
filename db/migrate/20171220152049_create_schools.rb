class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :uid
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.float :lat
      t.float :lon
      t.integer :region
      t.string :chief_administrator
      t.string :chief_administrator_title
      t.string :website
      t.integer :control
      t.integer :sector
      t.integer :level
      t.integer :highest_offering
      t.boolean :has_undergraduate_degrees
      t.boolean :has_graduate_degrees
      t.boolean :grants_degrees
      t.boolean :is_hbc
      t.boolean :has_medical_degrees
      t.boolean :has_hospital
      t.boolean :admissions_open_to_public
      t.boolean :is_closed
      t.integer :size_category
      t.integer :undergraduate_profile
      t.integer :enrollment_profile

      t.timestamps
    end
  end
end

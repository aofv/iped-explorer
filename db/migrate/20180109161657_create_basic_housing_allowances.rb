class CreateBasicHousingAllowances < ActiveRecord::Migration[5.1]
  def change
    create_table :basic_housing_allowances do |t|
      t.string :zip

      t.integer :e01_no_deps
      t.integer :e01_with_deps
      t.integer :e02_no_deps
      t.integer :e02_with_deps
      t.integer :e03_no_deps
      t.integer :e03_with_deps
      t.integer :e04_no_deps
      t.integer :e04_with_deps
      t.integer :e05_no_deps
      t.integer :e05_with_deps
      t.integer :e06_no_deps
      t.integer :e06_with_deps
      t.integer :e07_no_deps
      t.integer :e07_with_deps
      t.integer :e08_no_deps
      t.integer :e08_with_deps
      t.integer :e09_no_deps
      t.integer :e09_with_deps

      t.timestamps
    end
  end
end

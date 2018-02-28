class CreateDegreeProgramMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :degree_program_mappings do |t|
      t.references :school, foreign_key: true
      t.references :degree_program, foreign_key: true
      t.boolean :bachelor
      t.boolean :associate
      t.boolean :master
      t.boolean :doctorate
      t.boolean :distance

      t.timestamps
    end
  end
end

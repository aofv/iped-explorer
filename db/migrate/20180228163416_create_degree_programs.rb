class CreateDegreePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :degree_programs do |t|
      t.string :cip_family
      t.string :cip_code
      t.string :title
      t.text :description
      t.boolean :is_parent

      t.timestamps
    end
  end
end

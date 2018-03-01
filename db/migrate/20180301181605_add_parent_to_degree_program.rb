class AddParentToDegreeProgram < ActiveRecord::Migration[5.1]
  def change
    add_column :degree_programs, :parent_id, :integer
  end
end

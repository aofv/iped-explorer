class FixTypoInVets < ActiveRecord::Migration[5.1]
  def change
    rename_column :veterans, :total_undergarduate_students, :total_undergraduate_students
    rename_column :veterans, :average_graduate_benifits, :average_graduate_benefits
    rename_column :veterans, :total_graduate_benifits, :total_graduate_benefits
  end
end

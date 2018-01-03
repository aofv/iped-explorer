class CreateVeterans < ActiveRecord::Migration[5.1]
  def change
    create_table :veterans do |t|

      t.integer :year
      t.references :school

      t.integer :total_undergarduate_students   # UGPO9_N	Number receiving Post-9/11 GI Bill Benefits - undergraduate students
      t.integer :total_undergraduate_benefits   # UGPO9_T	Total amount of Post-9/11 GI Bill Benefits awarded - undergraduate students
      t.integer :average_undergraduate_benefits # UGPO9_A	Average amount of Post-9/11 GI Bill Benefits awarded - undergraduate students
      t.integer :total_graduate_students        # GPO9_N	Number receiving Post-9/11 GI Bill Benefits - graduate students
      t.integer :total_graduate_benifits        # GPO9_T	Total amount of Post-9/11 GI Bill Benefits awarded - graduate students
      t.integer :average_graduate_benifits      # GPO9_A	Average amount of Post-9/11 GI Bill Benefits awarded - graduate students
      t.integer :total_students                 # PO9_N	Number receiving Post-9/11 GI Bill Benefits - all students
      t.integer :total_benefits                 # PO9_T	Total amount of Post-9/11 GI Bill Benefits awarded - all students
      t.integer :average_benefits               # PO9_A	Average amount of Post-9/11 GI Bill Benefits awarded - all students

      t.timestamps
    end
  end
end

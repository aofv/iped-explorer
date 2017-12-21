class CreateSports < ActiveRecord::Migration[5.1]
  def change
    create_table :sport_teams do |t|
      t.integer :year
      t.references :school # 0
      t.string :sport # 127
      t.string :affiliation # 8
      t.string :division # 8
      t.integer :roster_size # 20 + 21
      t.integer :expenses # 22 + 24
      t.integer :revenue # 115 + 116

      t.timestamps
    end

    # inst
    create_table :sport_expenses do |t|
      t.integer :year
      t.references :school
      t.integer :student_aid_men # 5
      t.integer :student_aid_women # 6
      t.integer :student_aid_total # 8
      t.integer :recruiting_men # 12
      t.integer :recruiting_women # 13
      t.integer :recruiting_total # 15
      t.integer :total_revenue # 154
      t.integer :total_expenses #156

      t.timestamps
    end

  end
end

# FILE: ic2016_ay

class CreateCosts < ActiveRecord::Migration[5.1]
  def change
    create_table :costs do |t|
      t.integer :year
      t.references :school

      t.integer :average_in_state_tuition             # TUITION2
      t.integer :in_state_fees                        # FEE2
      t.integer :average_out_of_state_tuition         # TUITION3
      t.integer :out_of_stats_fees                    # FEE3
      t.integer :books_and_supplies                   # CHG4AY3
      t.integer :on_campus_room_and_board             # CHG5AY3
      t.integer :off_campus_room_and_board            # CHG7AY3

      t.timestamps
    end
  end
end

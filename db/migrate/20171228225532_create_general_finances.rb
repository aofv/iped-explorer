class CreateGeneralFinances < ActiveRecord::Migration[5.1]
  def change
    create_table :general_finances do |t|
      t.integer :year
      t.references :school
      t.float :total_assets
      t.float :total_expenses
      t.float :total_long_term_debt
      t.float :total_liabilities
      t.float :tuition_revenue
      t.float :total_revenue
      t.float :donations
      t.float :instruction_expenses
      t.float :instruction_salaries
      t.float :research_expenses
      t.float :research_salaries
      t.float :academic_support_expenses
      t.float :academic_support_salaries
      t.float :student_services_expenses
      t.float :student_services_salaries
      t.float :institutional_support_expenses
      t.float :institutional_support_salaries
      t.float :aux_expenses
      t.float :aux_salaries
      t.float :total_discounts
      t.float :value_of_endowment

      t.timestamps
    end
  end
end

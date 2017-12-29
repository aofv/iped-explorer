json.meta do
  json.total_records @finances.length
  json.school_id @school.id
  json.school_uid @school.uid
end

json.data @finances do |finance|
  json.id finance.id
  json.year finance.year
  json.total_assets finance.total_assets
  json.total_long_term_debt finance.total_long_term_debt
  json.total_liabilities finance.total_liabilities
  json.total_revenue finance.total_revenue
  json.tuition_revenue finance.tuition_revenue
  json.total_expenses finance.total_expenses
  json.donations finance.donations
  json.total_discounts finance.total_discounts
  json.endowment finance.value_of_endowment
end

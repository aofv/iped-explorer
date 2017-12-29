json.meta do
  json.school_id @school.id
  json.total_records @teams.size
end

json.data @teams do |team|
  json.id team.id
  json.sport team.sport
  json.affiliation team.affiliation
  json.division team.division
  json.roster_size team.roster_size
  json.expenses team.expenses
  json.revenue team.revenue
end

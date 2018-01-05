json.meta do
  json.total_records @veterans.length
end

json.data @veterans do |vet|
  json.id vet.id
  json.year vet.year

  json.total_students vet.total_students
  json.total_benefits vet.total_benefits
  json.average_benefits vet.average_benefits

  json.total_undergraduate_students vet.total_undergraduate_students
  json.total_undergraduate_benefits vet.total_undergraduate_benefits
  json.average_undergraduate_benefits vet.average_undergraduate_benefits

  json.total_graduate_students vet.total_graduate_students
  json.total_graduate_benefits vet.total_graduate_benefits
  json.average_graduate_benefits vet.average_graduate_benefits
end

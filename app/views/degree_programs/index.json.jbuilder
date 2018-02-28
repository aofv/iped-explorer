json.meta do
  json.total_records @programs.length
end

json.data @programs do |program_mapping|
  json.id program_mapping.degree_program.id
  json.cip_family program_mapping.degree_program.cip_family
  json.cip_code program_mapping.degree_program.cip_code
  json.title program_mapping.degree_program.title
  json.associate program_mapping.associate
  json.bachelor program_mapping.bachelor
  json.master program_mapping.master
  json.doctorate program_mapping.doctorate
  json.distance program_mapping.distance
end

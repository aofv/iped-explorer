json.meta do
  json.total_records @programs.length
end

json.data @programs do |program|
  json.id program.id
  json.cip_code program.cip_code
  json.cip_family program.cip_family
  json.title program.title
end

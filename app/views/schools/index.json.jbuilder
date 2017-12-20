json.meta do
  json.total_records @schools.total_count
  json.current_page @current_page
  json.total_pages @schools.total_pages
  json.records_per_page @records_per_page
end

json.data @schools do |school|
  json.partial! 'school', school: school
end

json.meta do
  json.total_records @schools.total_count
  json.current_page @current_page
  json.total_pages @schools.total_pages
  json.records_per_page @records_per_page
end

json.data @schools do |school|
  json.partial! 'school', school: school

  snapshot = school.school_snapshot
  json.admissions_rate snapshot.admissions_rate
  json.bha snapshot.bha
  json.in_state_cost snapshot.in_state_cost
  json.out_of_state_cost snapshot.out_of_state_cost
  json.on_campus_room_and_board snapshot.on_campus_room_and_board
  json.off_campus_room_and_board snapshot.off_campus_room_and_board
  json.books_and_supplies_cost snapshot.books_and_supplies
  json.total_undergrads snapshot.total_undergrads
end

json.meta do
  json.total_records @costs.length
end

json.data @costs do |cost|
  json.id cost.id
  json.year cost.year
  json.average_in_state_tuition cost.average_in_state_tuition
  json.in_state_fees cost.in_state_fees
  json.average_out_of_state_tuition cost.average_out_of_state_tuition
  json.out_of_state_fees cost.out_of_stats_fees
  json.on_campus_room_and_board cost.on_campus_room_and_board
  json.off_campus_room_and_board cost.off_campus_room_and_board
  json.books_and_supplies cost.books_and_supplies
end

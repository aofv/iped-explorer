SELECT
  s.id AS school_id,
  s.uid,
  s.name,
  ROUND((a.admissions / a.applications::FLOAT) * 100) AS admissions_rate,
  bha.e05_with_deps AS bha,
  (c.average_in_state_tuition + c.in_state_fees) AS in_state_cost,
  (c.average_out_of_state_tuition + c.out_of_stats_fees) AS out_of_state_cost,
  c.on_campus_room_and_board,
  c.off_campus_room_and_board,
  c.books_and_supplies,
  e.total AS total_undergrads
FROM
  schools s LEFT JOIN admissions a ON s.id = a.school_id
    AND a.year = (SELECT MAX(year) FROM admissions WHERE school_id = s.id)
    AND a.applications > 0
    AND a.admissions > 0
  LEFT JOIN basic_housing_allowances bha ON bha.zip = SUBSTRING(s.zip FROM 1 FOR 5)
  LEFT JOIN costs c ON c.school_id = s.id
    AND c.year = (SELECT MAX(year) FROM costs WHERE school_id = s.id)
  LEFT JOIN enrollments e ON e.school_id = s.id
    AND e.year = (SELECT MAX(year) FROM enrollments WHERE school_id = s.id)
    AND e.level_of_student = 1

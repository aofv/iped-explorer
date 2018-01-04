json.data @enrollments do |enrollment|
  json.id enrollment.id
  json.year enrollment.year
  json.level_of_student_name enrollment.level_of_student_name
  json.total enrollment.total
  json.male enrollment.male
  json.female enrollment.female
  json.asian enrollment.asian
  json.hispanic enrollment.hispanic
  json.white enrollment.white
  json.african_american enrollment.african_american
end

json.meta do
  json.total_records @admissions.length
  json.school_id @school.id
  json.school_uid @school.uid
end

json.data @admissions do |admission|
  json.id admission.id
  json.year admission.year
  json.applications admission.applications
  json.applications_male admission.applications_male
  json.applications_female admission.applications_female
  json.admissions admission.admissions
  json.admissions_male admission.admissions_male
  json.admissions_female admission.admissions_female
end

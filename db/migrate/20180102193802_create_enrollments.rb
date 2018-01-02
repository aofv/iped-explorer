class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
      t.references :school
      t.integer :year
      t.integer :level_of_student        # LSTUDY
      t.integer :total                  # EFYTOTLT
      t.integer :male                   # EFYTOTLM
      t.integer :female                 # EFYTOTLW
      t.integer :american_indian        # EFYAIANT	American Indian or Alaska Native total
      t.integer :american_indian_male   # EFYAIANM	American Indian or Alaska Native men
      t.integer :american_indian_female # EFYAIANW	American Indian or Alaska Native women
      t.integer :asian                  # EFYASIAT	Asian total
      t.integer :asian_male             # EFYASIAM	Asian men
      t.integer :asian_female           # EFYASIAW	Asian women
      t.integer :african_american       # EFYBKAAT	Black or African American total
      t.integer :african_american_male  # EFYBKAAM	Black or African American men
      t.integer :african_american_female# EFYBKAAW	Black or African American women
      t.integer :hispanic               # EFYHISPT	Hispanic or Latino total
      t.integer :hispanic_male          # EFYHISPM	Hispanic or Latino men
      t.integer :hispanic_female        # EFYHISPW	Hispanic or Latino women
      t.integer :pacific_islander       # EFYNHPIT	Native Hawaiian or Other Pacific Islander total
      t.integer :pacific_islander_male  # EFYNHPIM	Native Hawaiian or Other Pacific Islander men
      t.integer :pacific_islander_female# EFYNHPIW	Native Hawaiian or Other Pacific Islander women
      t.integer :white                  # EFYWHITT	White total
      t.integer :white_male             # EFYWHITM	White men
      t.integer :white_female           # EFYWHITW	White women
      t.integer :two_races              # EFY2MORT	Two or more races total
      t.integer :two_races_male         # EFY2MORM	Two or more races men
      t.integer :two_races_women        # EFY2MORW	Two or more races women
      t.integer :race_unknown           # EFYUNKNT	Race/ethnicity unknown total
      t.integer :race_unknown_male      # EFYUNKNM	Race/ethnicity unknown men
      t.integer :race_unknown_female    # EFYUNKNW	Race/ethnicity unknown women
      t.integer :non_resident           # EFYNRALT	Nonresident alien total
      t.integer :non_resident_male      # EFYNRALM	Nonresident alien men
      t.integer :non_resident_female    # EFYNRALW	Nonresident alien women

      t.timestamps
    end
  end
end

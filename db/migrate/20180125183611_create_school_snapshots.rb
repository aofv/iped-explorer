class CreateSchoolSnapshots < ActiveRecord::Migration[5.1]
  def change
    create_view :school_snapshots, materialized: true
  end
end

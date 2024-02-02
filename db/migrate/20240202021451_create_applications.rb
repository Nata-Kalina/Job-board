class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.string :resume_attachment
      t.string :cover_letter
      t.string :status
      t.timestamp :applied_at
      t.text :notes
      t.string :associated_job_id
      t.string :applicant_id

      t.timestamps
    end
  end
end

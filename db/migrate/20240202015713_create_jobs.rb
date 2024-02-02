class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.text :job_description
      t.string :job_company
      t.string :job_location
      t.string :job_type
      t.string :associated_company_id
      t.boolean :remote
      t.string :job_salary
      t.date :application_deadline
      t.timestamp :published_at
      t.date :expiration_date
      t.text :job_requirements
      t.text :job_responsibilities
      t.string :job_benefits
      t.string :associated_used_id
      t.string :job_category_id
      t.integer :views_count
      t.integer :applications_count

      t.timestamps
    end
  end
end

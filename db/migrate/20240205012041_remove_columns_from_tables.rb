class RemoveColumnsFromTables < ActiveRecord::Migration[7.0]
  def change
    remove_column :accounts, :account_user_id
    remove_column :applications, :associated_job_id
    remove_column :applications, :applicant_id
    remove_column :companies, :company_user_id
    remove_column :jobs, :associated_company_id
    remove_column :jobs, :associated_user_id
  end
end

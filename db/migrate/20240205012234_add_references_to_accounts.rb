class AddReferencesToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_reference :accounts, :user, foreign_key: true
    add_reference :applications, :account, foreign_key: true
    add_reference :companies, :account, foreign_key: true
    add_reference :jobs, :company, foreign_key: true
  end
end

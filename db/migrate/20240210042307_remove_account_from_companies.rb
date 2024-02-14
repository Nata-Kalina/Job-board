class RemoveAccountFromCompanies < ActiveRecord::Migration[7.0]
  def change
    remove_reference :companies, :account, null: false, foreign_key: true
  end
end

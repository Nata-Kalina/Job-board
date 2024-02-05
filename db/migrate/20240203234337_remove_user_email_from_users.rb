class RemoveUserEmailFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :user_email
  end
end

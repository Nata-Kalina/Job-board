class RenameUserColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :user_password, :password
  end
end

class RemoveColumnsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :password
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :user_phone_number
    remove_column :users, :user_location
    remove_column :users, :about_user
    remove_column :users, :user_role
    remove_column :users, :user_linkedin_profile
    remove_column :users, :user_website
  end
end

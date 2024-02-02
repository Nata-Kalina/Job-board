class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :user_phone_number
      t.string :user_email
      t.string :user_password
      t.string :user_location
      t.text :about_user
      t.string :user_role
      t.string :user_linkedin_profile
      t.string :user_website

      t.timestamps
    end
  end
end

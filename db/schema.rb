# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_02_05_012234) do
  create_table "accounts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "user_phone_number"
    t.string "user_location"
    t.text "about_user"
    t.string "user_role"
    t.string "user_linkedin_profile"
    t.string "user_website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "applications", force: :cascade do |t|
    t.string "resume_attachment"
    t.string "cover_letter"
    t.string "status"
    t.datetime "applied_at"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_applications_on_account_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_title"
    t.text "about_company"
    t.string "company_jobs"
    t.string "company_benefits"
    t.string "company_industry"
    t.string "company_website"
    t.string "company_location"
    t.string "company_email"
    t.integer "company_phone_number"
    t.string "company_linkedin_profile"
    t.string "company_facebook_profile"
    t.string "company_youtube_channel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_companies_on_account_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "job_title"
    t.text "job_description"
    t.string "job_company"
    t.string "job_location"
    t.string "job_type"
    t.boolean "remote"
    t.string "job_salary"
    t.date "application_deadline"
    t.datetime "published_at"
    t.date "expiration_date"
    t.text "job_requirements"
    t.text "job_responsibilities"
    t.string "job_benefits"
    t.string "associated_used_id"
    t.string "job_category_id"
    t.integer "views_count"
    t.integer "applications_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "applications", "accounts"
  add_foreign_key "companies", "accounts"
  add_foreign_key "jobs", "companies"
end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180122173954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "candidate_id"
    t.bigint "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.integer "stage_id"
    t.index ["candidate_id"], name: "index_applications_on_candidate_id"
    t.index ["job_id"], name: "index_applications_on_job_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "email"
    t.integer "phone"
    t.text "education"
    t.text "link_to_resume"
    t.text "work_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_stages", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "stage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_job_stages_on_job_id"
    t.index ["stage_id"], name: "index_job_stages_on_stage_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "description"
    t.string "status"
    t.string "employment_type"
    t.string "position"
    t.string "field"
    t.text "skills"
    t.string "education_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "stages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.bigint "company_id"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_users_on_company_id"
  end

  add_foreign_key "applications", "candidates"
  add_foreign_key "applications", "jobs"
  add_foreign_key "candidates", "users"
  add_foreign_key "job_stages", "jobs"
  add_foreign_key "job_stages", "stages"
  add_foreign_key "jobs", "users"
  add_foreign_key "users", "companies"
end

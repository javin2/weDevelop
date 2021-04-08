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

ActiveRecord::Schema.define(version: 2021_04_08_085051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "phone"
    t.string "email"
    t.integer "rate"
    t.string "profile_photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "developers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "company_name"
    t.string "email"
    t.string "profile_photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_notes_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.date "projected_completion"
    t.string "title"
    t.text "description"
    t.integer "percent_complete"
    t.integer "balance"
    t.bigint "client_id", null: false
    t.bigint "developer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_projects_on_client_id"
    t.index ["developer_id"], name: "index_projects_on_developer_id"
  end

  add_foreign_key "notes", "projects"
  add_foreign_key "projects", "clients"
  add_foreign_key "projects", "developers"
end

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

ActiveRecord::Schema.define(version: 2021_05_12_205025) do

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
    t.integer "rate"
    t.string "profile_photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["invitation_token"], name: "index_clients_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_clients_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_clients_on_invited_by"
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "conversations", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_conversations_on_project_id"
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
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["reset_password_token"], name: "index_developers_on_reset_password_token", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "conversation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "body"
    t.bigint "developer_id"
    t.bigint "client_id"
    t.index ["client_id"], name: "index_messages_on_client_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["developer_id"], name: "index_messages_on_developer_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "developer_id", null: false
    t.index ["developer_id"], name: "index_notes_on_developer_id"
    t.index ["project_id"], name: "index_notes_on_project_id"
  end

  create_table "project_members", force: :cascade do |t|
    t.integer "developer_id"
    t.integer "client_id"
    t.integer "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.date "projected_completion"
    t.string "title"
    t.text "description"
    t.integer "percent_complete"
    t.integer "balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "developer_id"
    t.index ["developer_id"], name: "index_projects_on_developer_id"
  end

  add_foreign_key "conversations", "projects"
  add_foreign_key "messages", "clients"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "developers"
  add_foreign_key "notes", "developers"
  add_foreign_key "notes", "projects"
  add_foreign_key "projects", "developers"
end

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

ActiveRecord::Schema.define(version: 2018_11_12_133746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artifact_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artifacts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.integer "discount"
    t.string "photo"
    t.boolean "free_shipping"
    t.bigint "cultural_origins_id"
    t.bigint "artifact_types_id"
    t.bigint "time_periods_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artifact_types_id"], name: "index_artifacts_on_artifact_types_id"
    t.index ["cultural_origins_id"], name: "index_artifacts_on_cultural_origins_id"
    t.index ["time_periods_id"], name: "index_artifacts_on_time_periods_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "check_out_date"
    t.date "return_date"
    t.bigint "user_id"
    t.bigint "artifact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artifact_id"], name: "index_bookings_on_artifact_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cultural_origins", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_periods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.float "average_rating"
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

  add_foreign_key "artifacts", "artifact_types", column: "artifact_types_id"
  add_foreign_key "artifacts", "cultural_origins", column: "cultural_origins_id"
  add_foreign_key "artifacts", "time_periods", column: "time_periods_id"
  add_foreign_key "bookings", "artifacts"
  add_foreign_key "bookings", "users"
end

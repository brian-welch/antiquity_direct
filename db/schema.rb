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

ActiveRecord::Schema.define(version: 2018_11_13_051129) do

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
    t.integer "percent_discount", default: 0
    t.string "photo"
    t.boolean "free_shipping", default: false
    t.bigint "cultural_origin_id"
    t.bigint "time_period_id"
    t.bigint "artifact_type_id"
    t.bigint "condition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artifact_type_id"], name: "index_artifacts_on_artifact_type_id"
    t.index ["condition_id"], name: "index_artifacts_on_condition_id"
    t.index ["cultural_origin_id"], name: "index_artifacts_on_cultural_origin_id"
    t.index ["time_period_id"], name: "index_artifacts_on_time_period_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "artifact_id"
    t.bigint "user_id"
    t.date "check_out_date"
    t.date "return"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artifact_id"], name: "index_bookings_on_artifact_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "artifacts", "artifact_types"
  add_foreign_key "artifacts", "conditions"
  add_foreign_key "artifacts", "cultural_origins"
  add_foreign_key "artifacts", "time_periods"
  add_foreign_key "bookings", "artifacts"
  add_foreign_key "bookings", "users"
end

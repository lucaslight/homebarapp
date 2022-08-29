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

ActiveRecord::Schema[7.0].define(version: 2022_08_29_141419) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cabinets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "ingredient_id", null: false
    t.boolean "in_stock", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_cabinets_on_ingredient_id"
    t.index ["user_id"], name: "index_cabinets_on_user_id"
  end

  create_table "cocktails", force: :cascade do |t|
    t.string "name"
    t.string "instructions"
    t.boolean "alcoholic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "measurements", force: :cascade do |t|
    t.integer "quantity"
    t.string "unit"
    t.bigint "cocktail_id", null: false
    t.bigint "ingredient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cocktail_id"], name: "index_measurements_on_cocktail_id"
    t.index ["ingredient_id"], name: "index_measurements_on_ingredient_id"
  end

  create_table "saved_cocktails", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "cocktail_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cocktail_id"], name: "index_saved_cocktails_on_cocktail_id"
    t.index ["user_id"], name: "index_saved_cocktails_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "age"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cabinets", "ingredients"
  add_foreign_key "cabinets", "users"
  add_foreign_key "measurements", "cocktails"
  add_foreign_key "measurements", "ingredients"
  add_foreign_key "saved_cocktails", "cocktails"
  add_foreign_key "saved_cocktails", "users"
end

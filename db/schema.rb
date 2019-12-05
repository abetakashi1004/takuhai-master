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

ActiveRecord::Schema.define(version: 2019_12_05_044134) do

  create_table "change_dates", force: :cascade do |t|
    t.integer "package_id"
    t.integer "time_zone_id"
    t.date "delivery_date"
    t.boolean "check", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "enduser_id"
    t.integer "delivery_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer "post_code_id"
    t.integer "sales_office_id"
    t.string "course_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer "delivery_person_id"
    t.integer "package_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_people", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sales_office_id"
    t.string "name"
    t.string "face_photo_id"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "career"
    t.index ["email"], name: "index_delivery_people_on_email", unique: true
    t.index ["reset_password_token"], name: "index_delivery_people_on_reset_password_token", unique: true
  end

  create_table "endusers", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "phone_number_id"
    t.string "name"
    t.integer "postcode"
    t.string "address"
    t.integer "level"
    t.integer "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_endusers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_endusers_on_reset_password_token", unique: true
  end

  create_table "ensusers", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "phone_number_id"
    t.string "name"
    t.integer "postcode"
    t.string "address"
    t.integer "level"
    t.integer "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_ensusers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_ensusers_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "enduser_id"
    t.integer "delivery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.integer "shipper_id"
    t.integer "product_name_id"
    t.integer "postcode_id"
    t.integer "time_zone_id"
    t.integer "phone_number_id"
    t.integer "size_id"
    t.integer "slip_number"
    t.string "destination"
    t.string "address"
    t.date "delivery_date"
    t.boolean "absence", default: false
    t.boolean "complete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.integer "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postcodes", force: :cascade do |t|
    t.integer "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sales_office_id"
    t.string "course_name"
  end

  create_table "product_names", force: :cascade do |t|
    t.string "product_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "redeliveries", force: :cascade do |t|
    t.integer "package_id"
    t.integer "time_zone_id"
    t.date "delivery_date"
    t.boolean "check", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_offices", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "password"
    t.string "sales_office_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_sales_offices_on_email", unique: true
    t.index ["reset_password_token"], name: "index_sales_offices_on_reset_password_token", unique: true
  end

  create_table "shippers", force: :cascade do |t|
    t.string "shipper_name"
    t.integer "postcode"
    t.string "address"
    t.integer "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.integer "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "takeouts", force: :cascade do |t|
    t.integer "delivery_person_id"
    t.integer "package_id"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_zones", force: :cascade do |t|
    t.string "time_zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "today_courses", force: :cascade do |t|
    t.integer "delivery_person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "postcode_id"
  end

end

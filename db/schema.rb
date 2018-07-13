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

ActiveRecord::Schema.define(version: 2018_07_11_133516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calls", force: :cascade do |t|
    t.integer "call_status", default: 0
    t.datetime "datetime"
    t.bigint "question_id"
    t.bigint "reply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["question_id"], name: "index_calls_on_question_id"
    t.index ["reply_id"], name: "index_calls_on_reply_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_questions_on_category_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.text "description"
    t.integer "reply_status", default: 0
    t.bigint "user_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "offer_cents", default: 0, null: false
    t.string "offer_currency", default: "EUR", null: false
    t.index ["question_id"], name: "index_replies_on_question_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "description"
    t.integer "rating"
    t.bigint "user_id"
    t.bigint "call_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_id"], name: "index_reviews_on_call_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "skype_username"
    t.string "whatsapp_number"
    t.string "street"
    t.string "city"
    t.string "zipcode"
    t.string "country"
    t.integer "role", default: 0, null: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "calls", "questions"
  add_foreign_key "calls", "replies"
  add_foreign_key "questions", "categories"
  add_foreign_key "questions", "users"
  add_foreign_key "replies", "questions"
  add_foreign_key "replies", "users"
  add_foreign_key "reviews", "calls"
  add_foreign_key "reviews", "users"
end

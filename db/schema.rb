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

ActiveRecord::Schema[7.0].define(version: 2022_08_05_110717) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.integer "number"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_posts", force: :cascade do |t|
    t.string "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "react"
    t.integer "dislike"
    t.integer "like"
    t.index ["user_id"], name: "index_question_posts_on_user_id"
  end

  create_table "question_responses", force: :cascade do |t|
    t.string "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_posts_id", null: false
    t.bigint "user_id", null: false
    t.index ["question_posts_id"], name: "index_question_responses_on_question_posts_id"
    t.index ["user_id"], name: "index_question_responses_on_user_id"
  end

  create_table "reacts", force: :cascade do |t|
    t.bigint "question_post_id", null: false
    t.bigint "user_id", null: false
    t.string "react"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_post_id"], name: "index_reacts_on_question_post_id"
    t.index ["user_id"], name: "index_reacts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "birthdate"
    t.string "email"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id", null: false
    t.index ["address_id"], name: "index_users_on_address_id"
  end

  add_foreign_key "question_posts", "users"
  add_foreign_key "question_responses", "question_posts", column: "question_posts_id"
  add_foreign_key "question_responses", "users"
  add_foreign_key "reacts", "question_posts"
  add_foreign_key "reacts", "users"
  add_foreign_key "users", "addresses"
end

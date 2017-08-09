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

ActiveRecord::Schema.define(version: 20170809231436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "options", force: :cascade do |t|
    t.string "name"
  end

  create_table "question_options", force: :cascade do |t|
    t.integer "question_id"
    t.integer "option_id"
    t.index ["option_id"], name: "index_question_options_on_option_id", using: :btree
    t.index ["question_id"], name: "index_question_options_on_question_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.integer "answer_id"
    t.integer "survey_id"
    t.index ["answer_id"], name: "index_questions_on_answer_id", using: :btree
    t.index ["survey_id"], name: "index_questions_on_survey_id", using: :btree
  end

  create_table "surveys", force: :cascade do |t|
    t.integer "user_id"
    t.index ["user_id"], name: "index_surveys_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
  end

  add_foreign_key "question_options", "options"
  add_foreign_key "question_options", "questions"
  add_foreign_key "questions", "options", column: "answer_id"
  add_foreign_key "questions", "surveys"
  add_foreign_key "surveys", "users"
end

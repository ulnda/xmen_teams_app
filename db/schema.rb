# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150924193853) do

  create_table "mutant_teams", force: true do |t|
    t.integer  "mutant_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mutant_teams", ["mutant_id", "team_id"], name: "index_mutant_teams_on_mutant_and_team", unique: true
  add_index "mutant_teams", ["mutant_id"], name: "index_mutant_teams_on_mutant_id"
  add_index "mutant_teams", ["team_id"], name: "index_mutant_teams_on_team_id"

  create_table "mutants", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_tasks", force: true do |t|
    t.integer  "team_id"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_tasks", ["task_id"], name: "index_team_tasks_on_task_id"
  add_index "team_tasks", ["team_id", "task_id"], name: "index_team_tasks_on_team_and_task", unique: true
  add_index "team_tasks", ["team_id"], name: "index_team_tasks_on_team_id"

  create_table "teams", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

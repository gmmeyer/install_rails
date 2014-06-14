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

ActiveRecord::Schema.define(version: 20140614193953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "edges", force: true do |t|
    t.integer  "previous_step_id"
    t.integer  "next_step_id"
    t.string   "choice"
    t.string   "os"
    t.string   "os_version"
    t.string   "rails_version"
    t.string   "ruby_version"
    t.string   "button_text"
    t.boolean  "single_edge"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", force: true do |t|
    t.string   "title"
    t.string   "step_name"
    t.text     "content"
    t.text     "trouble"
    t.string   "mixpanel"
    t.boolean  "final_step"
    t.boolean  "first_step"
    t.string   "prompt"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "steps", ["permalink"], name: "index_steps_on_permalink", using: :btree

  create_table "users", force: true do |t|
    t.boolean  "guest"
    t.string   "os"
    t.string   "os_version"
    t.string   "ruby_version"
    t.string   "rails_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "password_digest"
    t.string   "token"
    t.boolean  "admin"
  end

end

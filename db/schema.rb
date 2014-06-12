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

ActiveRecord::Schema.define(version: 20140611235123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "operating_systems", force: true do |t|
    t.string   "brand"
    t.string   "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "step_contents", force: true do |t|
    t.string   "title"
    t.string   "step_name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", force: true do |t|
    t.integer  "previous_step_id"
    t.integer  "step_content_id"
    t.integer  "operating_system_id"
    t.boolean  "final_step"
    t.boolean  "first_step"
    t.string   "choice"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "prompt"
    t.string   "button_text"
  end

  create_table "users", force: true do |t|
    t.boolean  "guest"
    t.string   "os"
    t.string   "os_version"
    t.string   "ruby_version"
    t.string   "rails_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

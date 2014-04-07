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

ActiveRecord::Schema.define(version: 20140407183647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.uuid     "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["body"], name: "index_jobs_on_body", using: :btree
  add_index "jobs", ["created_at"], name: "index_jobs_on_created_at", using: :btree
  add_index "jobs", ["title"], name: "index_jobs_on_title", using: :btree
  add_index "jobs", ["updated_at"], name: "index_jobs_on_updated_at", using: :btree
  add_index "jobs", ["uuid"], name: "index_jobs_on_uuid", using: :btree

  create_table "sign_ups", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "uuid"
    t.datetime "email_sent_on"
    t.integer  "user_id"
  end

  add_index "sign_ups", ["created_at"], name: "index_sign_ups_on_created_at", using: :btree
  add_index "sign_ups", ["email"], name: "index_sign_ups_on_email", using: :btree
  add_index "sign_ups", ["email_sent_on"], name: "index_sign_ups_on_email_sent_on", using: :btree
  add_index "sign_ups", ["updated_at"], name: "index_sign_ups_on_updated_at", using: :btree
  add_index "sign_ups", ["uuid"], name: "index_sign_ups_on_uuid", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.uuid     "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["created_at"], name: "index_users_on_created_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["password_digest"], name: "index_users_on_password_digest", using: :btree
  add_index "users", ["updated_at"], name: "index_users_on_updated_at", using: :btree
  add_index "users", ["uuid"], name: "index_users_on_uuid", using: :btree

end

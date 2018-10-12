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

ActiveRecord::Schema.define(version: 2018_10_12_172516) do

  create_table "clients", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "company"
    t.date "date_of_birth"
    t.string "email"
    t.string "phone"
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.string "occupation"
    t.integer "entity_type"
    t.date "tax_year_ends"
    t.integer "filing_status"
    t.boolean "discontinue"
    t.integer "tax_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "form"
    t.string "states"
    t.integer "status"
    t.boolean "printed", default: false
    t.boolean "scanned", default: false
    t.boolean "uploaded", default: false
    t.date "filed"
    t.boolean "accepted", default: false
    t.boolean "rejected", default: false
    t.text "notes"
    t.integer "job_type"
    t.float "price", default: 0.0
    t.boolean "confirm_ack", default: false
    t.boolean "paid_in_full", default: false
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_jobs_on_client_id"
  end

end

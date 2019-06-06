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

ActiveRecord::Schema.define(version: 2019_06_06_135007) do

  create_table "bails", force: :cascade do |t|
    t.string "title"
    t.float "value"
    t.string "currency"
    t.integer "credit_request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credit_request_id"], name: "index_bails_on_credit_request_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "street_name"
    t.string "house_number"
    t.string "post_code"
    t.string "city"
    t.datetime "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_requests", force: :cascade do |t|
    t.integer "client_id"
    t.float "value"
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_credit_requests_on_client_id"
  end

end

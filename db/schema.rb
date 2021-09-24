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

ActiveRecord::Schema.define(version: 2021_09_24_103424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "excavators", force: :cascade do |t|
    t.string "CompanyName"
    t.string "Address"
    t.string "State"
    t.string "Zip"
    t.string "Type"
    t.jsonb "Contact"
    t.jsonb "FieldContact"
    t.boolean "CrewOnsite"
    t.bigint "ticket_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ticket_id"], name: "index_excavators_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "ContactCenter"
    t.string "RequestNumber"
    t.string "SequenceNumber"
    t.string "RequestType"
    t.string "RequestAction"
    t.string "WellKnownText"
    t.jsonb "DateTimes"
    t.jsonb "ServiceArea"
    t.jsonb "AdditionalServiceArea"
    t.jsonb "DigsiteInfo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end

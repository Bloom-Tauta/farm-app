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

ActiveRecord::Schema[7.0].define(version: 2023_03_05_004441) do
  create_table "farmers", force: :cascade do |t|
    t.string "name"
    t.integer "phone"
  end

  create_table "farms", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "farmer_id"
    t.index ["farmer_id"], name: "index_farms_on_farmer_id"
  end

  create_table "vegetables", force: :cascade do |t|
    t.string "img_url"
    t.string "name"
    t.string "description"
    t.string "review"
    t.integer "farm_id"
    t.integer "farmer_id"
    t.index ["farm_id"], name: "index_vegetables_on_farm_id"
    t.index ["farmer_id"], name: "index_vegetables_on_farmer_id"
  end

  add_foreign_key "farms", "farmers"
  add_foreign_key "vegetables", "farmers"
  add_foreign_key "vegetables", "farms"
end

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

ActiveRecord::Schema[8.1].define(version: 2024_11_18_184646) do
  create_table "contents", force: :cascade do |t|
    t.integer "page_id", null: false
    t.string "position", null: false
    t.string "body"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_contents_on_page_id"
  end

  create_table "pages", force: :cascade do |t|
    t.integer "site_id", null: false
    t.string "type"
    t.string "name", null: false
    t.string "anchor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anchor", "site_id"], name: "index_pages_on_anchor_and_site_id", unique: true
    t.index ["name", "site_id"], name: "index_pages_on_name_and_site_id", unique: true
    t.index ["site_id"], name: "index_pages_on_site_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_sites_on_title", unique: true
  end

  add_foreign_key "contents", "pages"
  add_foreign_key "pages", "sites"
end

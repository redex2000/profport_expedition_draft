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

ActiveRecord::Schema.define(version: 2018_12_18_065517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "fio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "books_count", default: 0
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "coverings", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "details", force: :cascade do |t|
    t.string "title"
    t.bigint "spaceship_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "part_id"
    t.string "part_type"
    t.index ["spaceship_id"], name: "index_details_on_spaceship_id"
  end

  create_table "engines", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expeditions", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state", default: 0
  end

  create_table "galaxies", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "title"
    t.bigint "expedition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "route_length", default: 0.0
    t.index ["expedition_id"], name: "index_itineraries_on_expedition_id", unique: true
  end

  create_table "itinerary_planets", force: :cascade do |t|
    t.bigint "itinerary_id"
    t.bigint "planet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_itinerary_planets_on_itinerary_id"
    t.index ["planet_id"], name: "index_itinerary_planets_on_planet_id"
  end

  create_table "paper_boxes", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paper_boxes_papers", id: false, force: :cascade do |t|
    t.bigint "paper_box_id", null: false
    t.bigint "paper_id", null: false
    t.index ["paper_box_id"], name: "index_paper_boxes_papers_on_paper_box_id"
    t.index ["paper_id"], name: "index_paper_boxes_papers_on_paper_id"
  end

  create_table "papers", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paragraphs", force: :cascade do |t|
    t.string "title"
    t.boolean "published", default: false
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_paragraphs_on_book_id"
  end

  create_table "planets", force: :cascade do |t|
    t.string "title"
    t.string "galaxy"
    t.text "description"
    t.float "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spaceships", force: :cascade do |t|
    t.string "title"
    t.float "velocity"
    t.bigint "expedition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "working", default: true
    t.string "type"
    t.index ["expedition_id"], name: "index_spaceships_on_expedition_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fio"
    t.integer "age"
    t.bigint "expedition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expedition_id"], name: "index_users_on_expedition_id"
  end

  add_foreign_key "details", "spaceships"
  add_foreign_key "itineraries", "expeditions"
  add_foreign_key "itinerary_planets", "itineraries"
  add_foreign_key "itinerary_planets", "planets"
  add_foreign_key "paragraphs", "books"
  add_foreign_key "spaceships", "expeditions"
  add_foreign_key "users", "expeditions"
end

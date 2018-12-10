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

ActiveRecord::Schema.define(version: 2018_12_08_070820) do

  create_table "authors", force: :cascade do |t|
    t.string "fio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "books_count", default: 0
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "corporations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expeditions", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "corporation_id"
    t.datetime "start_date"
    t.boolean "active", default: false
    t.index ["corporation_id"], name: "index_expeditions_on_corporation_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "title"
    t.integer "expedition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expedition_id"], name: "index_itineraries_on_expedition_id", unique: true
  end

  create_table "itinerary_planets", force: :cascade do |t|
    t.integer "itinerary_id"
    t.integer "planet_id"
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
    t.integer "paper_box_id", null: false
    t.integer "paper_id", null: false
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
    t.integer "book_id"
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
    t.integer "expedition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expedition_id"], name: "index_spaceships_on_expedition_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fio"
    t.integer "age"
    t.integer "expedition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expedition_id"], name: "index_users_on_expedition_id"
  end

end
